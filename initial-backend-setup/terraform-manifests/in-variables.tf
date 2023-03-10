variable "aws_region"{
    type = string
    default = "us-east-1"
}

variable "object_list" {
    type = list
    default = ["eks-cluster", "app1k8s"]
}