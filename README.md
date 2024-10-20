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
| [aws_kms_key.kms_key_arn](https://registry.terraform.io/providers/hashicorp/aws/5.58.0/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agendamento_backup"></a> [agendamento\_backup](#input\_agendamento\_backup) | Periodicidade com que o backup é realizado | `string` | `"Default_TF"` | no |
| <a name="input_force_destruir"></a> [force\_destruir](#input\_force\_destruir) | Habiliar ou não destruição obrigatória | `bool` | n/a | yes |
| <a name="input_iam_role_arn_backup"></a> [iam\_role\_arn\_backup](#input\_iam\_role\_arn\_backup) | ARN da role do modulo IAM | `string` | `"Default_TF"` | no |
| <a name="input_inicio_manutencao"></a> [inicio\_manutencao](#input\_inicio\_manutencao) | Especifique(em minutos) o período em que o plano de backup será iniciado, caso não comece no horário especificado. | `number` | n/a | yes |
| <a name="input_janela_manutencao"></a> [janela\_manutencao](#input\_janela\_manutencao) | Defina(em minutos) o período durante o qual o backup deve ser concluído antes de retornar qualquer erro por timeout. | `number` | n/a | yes |
| <a name="input_nome_cofre"></a> [nome\_cofre](#input\_nome\_cofre) | Nome do cofre de backup | `string` | `"Default_TF"` | no |
| <a name="input_nome_plano_backup"></a> [nome\_plano\_backup](#input\_nome\_plano\_backup) | Nome do plano de backup | `string` | `"Default_TF"` | no |
| <a name="input_nome_regra"></a> [nome\_regra](#input\_nome\_regra) | Nome da regra que fará o backup | `string` | `"Default_TF"` | no |
| <a name="input_nome_selecao_alvo_tag"></a> [nome\_selecao\_alvo\_tag](#input\_nome\_selecao\_alvo\_tag) | Nome da seleção de alvos feita por tags | `string` | `"Default_TF"` | no |
| <a name="input_quantidade_dias_para_delecao"></a> [quantidade\_dias\_para\_delecao](#input\_quantidade\_dias\_para\_delecao) | Quanditade de dias que o backup fica retido até ser deletado permanentemente | `number` | `7` | no |
| <a name="input_selecao_recurso_tag_key"></a> [selecao\_recurso\_tag\_key](#input\_selecao\_recurso\_tag\_key) | Palavra chave que será usado para incluir recurso no plano de backup | `string` | n/a | yes |
| <a name="input_selecao_recurso_tag_type"></a> [selecao\_recurso\_tag\_type](#input\_selecao\_recurso\_tag\_type) | Simbolo logico para operação | `string` | n/a | yes |
| <a name="input_selecao_recurso_tag_value"></a> [selecao\_recurso\_tag\_value](#input\_selecao\_recurso\_tag\_value) | Valor Booleano para habilitar ou desabilitar backup | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_cofre_arn"></a> [backup\_cofre\_arn](#output\_backup\_cofre\_arn) | n/a |
| <a name="output_backup_cofre_id"></a> [backup\_cofre\_id](#output\_backup\_cofre\_id) | Saidas Backup |
| <a name="output_kms_arn"></a> [kms\_arn](#output\_kms\_arn) | n/a |
| <a name="output_kms_id"></a> [kms\_id](#output\_kms\_id) | Saidas KMS |
<!-- END_TF_DOCS -->