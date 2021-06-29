resource "aws_cloudwatch_dashboard" "this" {
  dashboard_name = "${var.prefix}-TechTalk_Demo"

  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 9,
      "properties": {
        "view": "timeSeries",
        "stacked": false,
        "metrics": [
          [ "AWS/ApplicationELB", "RequestCount", "LoadBalancer", "${aws_lb.this.arn_suffix}" ],
          [ ".", "ActiveConnectionCount", ".", "." ],
          [ ".", "NewConnectionCount", ".", "." ]
        ],
        "region": "us-east-2",
        "title": "Tráfico Web"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 9,
      "width": 6,
      "height": 3,
      "properties": {
        "view": "singleValue",
        "metrics": [
          [ "AWS/ApplicationELB", "HealthyHostCount", "TargetGroup", "${aws_lb_target_group.this.arn_suffix}", "LoadBalancer", "${aws_lb.this.arn_suffix}" ]
        ],
        "region": "us-east-2",
        "title": "Hosts activos"
      }
    },
    {
      "type": "metric",
      "x": 6,
      "y": 9,
      "width": 6,
      "height": 3,
      "properties": {
        "view": "singleValue",
        "stacked": false,
        "metrics": [
          [ "AWS/ApplicationELB", "UnHealthyHostCount", "TargetGroup", "${aws_lb_target_group.this.arn_suffix}", "LoadBalancer", "${aws_lb.this.arn_suffix}" ]
        ],
        "region": "us-east-2",
        "title": "Hosts inactivos"
      }
    },
    {
      "type": "metric",
      "x": 12,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [ "AWS/EC2", "CPUUtilization", "InstanceId", "${module.ec2_web_cluster.id[0]}", { "stat": "Average", "id": "m1", "visible": false, "region": "us-east-2" } ],
          [ { "id": "e1", "expression": "AVG([m1])", "label": "us-east-2a", "region": "us-east-2" } ]
        ],
        "legend": {
          "position": "bottom"
        },
        "period": 300,
        "view": "timeSeries",
        "stacked": true,
        "start": "-PT3H",
        "end": "P0D",
        "title": "t4g.micro - CPUUtilization",
        "region": "us-east-2"
      }
    },
    {
      "type": "metric",
      "x": 18,
      "y": 6,
      "width": 6,
      "height": 6,
      "properties": {
        "metrics": [
          [ "AWS/EC2", "NetworkOut", "InstanceId", "${module.ec2_web_cluster.id[0]}", { "stat": "Average", "id": "m1", "visible": false, "region": "us-east-2" } ],
          [ { "id": "e1", "expression": "AVG([m1])", "label": "us-east-2a", "region": "us-east-2" } ]
        ],
        "legend": {
          "position": "bottom"
        },
        "period": 300,
        "view": "timeSeries",
        "stacked": false,
        "start": "-PT3H",
        "end": "P0D",
        "title": "t4g.micro - NetworkOut",
        "region": "us-east-2"
      }
    },
    {
      "type": "metric",
      "x": 12,
      "y": 6,
      "width": 6,
      "height": 6,
      "properties": {
        "metrics": [
          [ "AWS/EC2", "NetworkIn", "InstanceId", "${module.ec2_web_cluster.id[0]}", { "stat": "Average", "id": "m1", "visible": false, "region": "us-east-2" } ],
            [ { "id": "e1", "expression": "AVG([m1])", "label": "us-east-2a", "region": "us-east-2" } ]
        ],
        "legend": {
          "position": "bottom"
        },
        "period": 300,
        "view": "timeSeries",
        "stacked": false,
        "start": "-PT3H",
        "end": "P0D",
        "title": "t4g.micro - NetworkIn",
        "region": "us-east-2"
      }
    }
  ]
}
EOF
}
