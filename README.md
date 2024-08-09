# Modulo-
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.58.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_backup_plan.plano_backup](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/backup_plan) | resource |
| [aws_backup_selection.selecao_alvo_tag](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/backup_selection) | resource |
| [aws_backup_vault.cofre_backup](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/backup_vault) | resource |
| [aws_backup_vault_policy.vault_policy](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/backup_vault_policy) | resource |
| [aws_iam_role.role_backup](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/resources/iam_role) | resource |
| [aws_kms_key.kms_key_arn](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agendamento_backup"></a> [agendamento\_backup](#input\_agendamento\_backup) | Periodicidade com que o backup é realizado | `string` | `"cron(0 15 * * ? *)"` | no |
| <a name="input_nome_cofre"></a> [nome\_cofre](#input\_nome\_cofre) | Nome do cofre de backup | `string` | `"cofre_backup_tag"` | no |
| <a name="input_nome_plano_backup"></a> [nome\_plano\_backup](#input\_nome\_plano\_backup) | Nome do plano de backup | `string` | `"plano_backup_tag"` | no |
| <a name="input_nome_regra"></a> [nome\_regra](#input\_nome\_regra) | Nome da regra que fará o backup | `string` | `"backup_tag_diario"` | no |
| <a name="input_nome_role_backup"></a> [nome\_role\_backup](#input\_nome\_role\_backup) | Nome da role/função para permitir o AWSBackup gerenciar os pontos de restauração | `string` | `"role_backup"` | no |
| <a name="input_nome_selecao_alvo_tag"></a> [nome\_selecao\_alvo\_tag](#input\_nome\_selecao\_alvo\_tag) | Nome da seleção de alvos feita por tags | `string` | `"selecao_alvo_tag"` | no |
| <a name="input_quantidade_dias_para_delecao"></a> [quantidade\_dias\_para\_delecao](#input\_quantidade\_dias\_para\_delecao) | Quanditade de dias que o backup fica retido até ser deletado permanentemente | `number` | `7` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_cofre_arn"></a> [backup\_cofre\_arn](#output\_backup\_cofre\_arn) | n/a |
| <a name="output_backup_cofre_id"></a> [backup\_cofre\_id](#output\_backup\_cofre\_id) | Saidas Backup |
| <a name="output_kms_arn"></a> [kms\_arn](#output\_kms\_arn) | n/a |
| <a name="output_kms_id"></a> [kms\_id](#output\_kms\_id) | Saidas KMS |
<!-- END_TF_DOCS -->