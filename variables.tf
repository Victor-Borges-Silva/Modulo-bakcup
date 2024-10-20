# Recurso do Backup Vault
variable "nome_cofre" {
  type        = string
  default     = "Default_TF"
  description = "Nome do cofre de backup"
}

variable "force_destruir" {
  type        = bool
  description = "Habiliar ou não destruição obrigatória"
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

variable "inicio_manutencao" {
  type        = number
  description = "Especifique(em minutos) o período em que o plano de backup será iniciado, caso não comece no horário especificado."
}

variable "janela_manutencao" {
  type        = number
  description = "Defina(em minutos) o período durante o qual o backup deve ser concluído antes de retornar qualquer erro por timeout."
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

variable "iam_role_arn_backup" {
  type        = string
  default     = "Default_TF"
  description = "ARN da role do modulo IAM"
}

variable "selecao_recurso_tag_type" {
  type        = string
  description = "Simbolo logico para operação"
}

variable "selecao_recurso_tag_key" {
  type        = string
  description = "Palavra chave que será usado para incluir recurso no plano de backup"
}

variable "selecao_recurso_tag_value" {
  type        = string
  description = "Valor Booleano para habilitar ou desabilitar backup"
}
