provider "yandex" {
  service_account_key_file = var.sa_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.yc_zone
}


# Сеть
resource "yandex_vpc_network" "diploma_network" {
  name = "diploma-network"
}

# Подсеть
resource "yandex_vpc_subnet" "diploma_subnet" {
  name           = "diploma-subnet"
  zone           = var.yc_zone
  network_id     = yandex_vpc_network.diploma_network.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}

# ВМ: Служебный сервер (srv)
resource "yandex_compute_instance" "srv" {
  name        = "srv"
  zone        = var.yc_zone
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.diploma_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.vm_ssh_key_path)}"
  }
}

# ВМ: Kubernetes Master
resource "yandex_compute_instance" "k8s_master" {
  name        = "k8s-master"
  zone        = var.yc_zone
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.diploma_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.vm_ssh_key_path)}"
  }
}

# ВМ: Kubernetes Worker
resource "yandex_compute_instance" "k8s_worker" {
  name        = "k8s-worker"
  zone        = var.yc_zone
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.diploma_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.vm_ssh_key_path)}"
  }
}
