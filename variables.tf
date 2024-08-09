# Recurso do Backup Vault
variable "nome_cofre" {
  type        = string
  default     = "Default_TF"
  description = "Nome do cofre de backup"
}

#Recuso para criar o plano de Backup e suas regras
variable "nome_plano_backup" {
  type        = string
  default     = "Default_TF"
  description = "Nome do plano de backup"
}

variable "nome_regra" {
  type        = string
  default     = "Default_TF"
  description = "Nome da regra que fará o backup"
}

variable "agendamento_backup" {
  type        = string
  default     = "Default_TF"
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
  default     = "Default_TF"
  description = "Nome da seleção de alvos feita por tags"
}

#IAM Role para o plano de backup
variable "nome_role_backup" {
  type        = string
  default     = "Default_TF"
  description = "Nome da role/função para permitir o AWSBackup gerenciar os pontos de restauração"
}
