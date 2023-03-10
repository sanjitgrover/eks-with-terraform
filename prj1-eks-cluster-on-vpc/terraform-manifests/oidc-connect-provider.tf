data "aws_partition" "current" {}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer

  client_id_list = ["sts.${data.aws_partition.current.dns_suffix}"]

  thumbprint_list = [var.eks_oidc_root_ca_thumbprint]
  
  tags = merge (
  {Name = "${var.cluster_name}-eks-irsa"},
  local.common_tags,
  
  )
}

locals {
  aws_iam_openid_connect_provider_extract_from_arn = element(split("oidc-provider/","${aws_iam_openid_connect_provider.oidc_provider.arn}"),1)
}

output "aws_iam_openid_connect_provider_arn" {
  value = aws_iam_openid_connect_provider.oidc_provider.arn
}