variable "sa_key_file" {
  description = "Путь до JSON-файла с ключом сервисного аккаунта"
  type        = string
}

variable "yc_token" {
  description = "OAuth-токен для доступа к Яндекс.Облаку"
  type        = string
}

variable "cloud_id" {
  description = "ID облака"
  type        = string
}

variable "folder_id" {
  description = "ID папки"
  type        = string
}

variable "yc_zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "vm_ssh_key_path" {
  description = "Путь до публичного SSH-ключа"
  type        = string
}

variable "image_id" {
  description = "ID образа для ВМ"
  type        = string
}
