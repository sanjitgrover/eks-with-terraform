output "bucket_name" {
  value = module.s3-bucket.s3_bucket_id
}


output "cluster_folder" {
    value = resource.aws_s3_object.cluster.id
}

output "k8s_folder" {
    value = resource.aws_s3_object.k8s.id
}

output "cluster_table" {
    value = aws_dynamodb_table.cluster-table.name
}

output "k8s_table" {
    value = aws_dynamodb_table.k8s-table.name
}