# Ansible Kubernetes Cluster Setup

## 📌 Описание

Данный проект предназначен для автоматизированного развёртывания Kubernetes-кластера с помощью Ansible. Кластер состоит из одного управляющего узла (k8s-master), одного или нескольких рабочих узлов (k8s-worker) и вспомогательного сервера (srv), на котором размещаются инструменты мониторинга.

---

## 🏗 Структура проекта

ansible/
├── inventory/
│ └── hosts.ini # Список всех серверов: master, workers, srv
├── playbooks/
│ ├── init.yml # Подготовка серверов (swap, ssh, time, и пр.)
│ ├── docker.yml # Установка Docker на все узлы
│ ├── kube-deps.yml # Установка kubeadm, kubelet, kubectl
│ ├── master.yml # Инициализация master-нод
│ ├── workers.yml # Присоединение workers к кластеру
│ └── monitoring.yml # Установка мониторинга на srv
├── roles/ # При необходимости — роли Ansible
└── README.md # Документация по проекту
## 🖥  Узлы в инфраструктуре

| Роль         | Назначение                                               |
|--------------|-----------------------------------------------------------|
| k8s-master | Управляющий узел: API Server, Scheduler, Controller Mgr  |
| k8s-worker | Рабочие ноды для запуска приложений                      |
| srv        | Отдельный сервер, где размещаются: Prometheus, Grafana, Alertmanager, Loki и др. |
