# Recurso do Backup Vault
variable "nome_cofre" {
  type        = string
  default     = "cofre_backup_tag"
  description = "Nome do cofre de backup"
}

#Recuso para criar o plano de Backup e suas regras
variable "nome_plano_backup" {
  type        = string
  default     = "plano_backup_tag"
  description = "Nome do plano de backup"
}

variable "nome_regra" {
  type        = string
  default     = "backup_tag_diario"
  description = "Nome da regra que fará o backup"
}

variable "agendamento_backup" {
  type        = string
  default     = "cron(0 15 * * ? *)" # agendametno é feito conforme horário UTC +00
  description = "Periodicidade com que o backup é realizado"
}

variable "quantidade_dias_para_delecao" {
  type        = number
  default     = 7
  description = "Quanditade de dias que o backup fica retido até ser deletado permanentemente"
}

# Seleção de recursos com base em tags
variable "nome_selecao_alvo_tag" {
  type        = string
  default     = "selecao_alvo_tag"
  description = "Nome da seleção de alvos feita por tags"
}

#IAM Role para o plano de backup
variable "nome_role_backup" {
  type        = string
  default     = "role_backup"
  description = "Nome da role/função para permitir o AWSBackup gerenciar os pontos de restauração"
}
