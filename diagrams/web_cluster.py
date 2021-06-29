from diagrams import Cluster, Diagram, Edge
from diagrams.aws.compute import EC2, EC2AutoScaling
from diagrams.aws.network import VPC, PublicSubnet, ALB, Route53
from diagrams.aws.general import User, Users
from diagrams.aws.security import ACM
from diagrams.aws.storage import S3
from diagrams.aws.database import DDB

diagram_attr = {
    "fontsize":"30",
}

cluster_attr = {
    # "layout": "dot",
    "fontsize": "16",
    "pencolor": "gray",
    "penwidth": "3.0"
}

with Diagram("Web Cluster", show=False, direction="LR", graph_attr=diagram_attr, filename="web_cluster"):
    users = Users("Users")
    with Cluster("AWS", graph_attr=cluster_attr):
        dns = Route53("DNS")
        acm = ACM("Certificate")
        deploy = S3("Deploy")
        with Cluster("VPC", graph_attr=cluster_attr):
            alb = ALB("Load Balancer")
            with Cluster("Target Group", graph_attr=cluster_attr):
                web_cluster = []
                for n in range(2):
                    instance = EC2("Web App [{}]".format(n))
                    web_cluster.append(instance)
                    
    users >> dns >> Edge(label="https") \
        >> alb >> Edge(label="http", color="red") \
        >> web_cluster 
    acm - alb
    deploy \
        >> Edge(color="darkgreen", style="dotted") \
        >> web_cluster