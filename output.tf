#Saidas KMS
output "kms_id" {
  value = data.aws_kms_key.kms_key_arn.id
}

output "kms_arn" {
  value = data.aws_kms_key.kms_key_arn.arn
}

#Saidas Backup
output "backup_cofre_id" {
  value = aws_backup_vault.cofre_backup.id
}

output "backup_cofre_arn" {
  value = aws_backup_vault.cofre_backup.arn
}