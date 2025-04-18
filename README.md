# GCP Infra Project

Este repositório contém o projeto desenvolvido para a disciplina de **Cloud e SRE** do 5º período da faculdade. O objetivo da atividade é provisionar e configurar uma infraestrutura na **Google Cloud Platform (GCP)** utilizando **Terraform**.

## Objetivo do Projeto

1. Criar uma máquina virtual na GCP.
2. Configurar regras de firewall para a máquina virtual.
3. Instalar e configurar uma aplicação Java na máquina virtual provisionada.

## Ferramentas Utilizadas

- **Google Cloud Platform (GCP)**: Provedor de nuvem utilizado.
- **Terraform**: Ferramenta de IaC (Infrastructure as Code) para provisionamento da infraestrutura.
- **Java**: Linguagem da aplicação a ser instalada.

## Estrutura do Repositório

```plaintext
├── main.tf          # Arquivo principal do Terraform
├── variables.tf     # Definição de variáveis do Terraform
├── outputs.tf       # Saídas do Terraform
├── README.md        # Documentação do projeto
└── scripts/
    └── install_app.sh  # Script para instalação da aplicação Java
```

## Como Executar o Projeto

1. **Pré-requisitos**:
   - Conta na GCP com permissões adequadas.
   - Terraform instalado na máquina local.
   - Configuração do `gcloud` CLI.

2. **Passos**:
   - Clone este repositório:
     ```bash
     git clone <URL_DO_REPOSITORIO>
     cd gcp-infra-project
     ```
   - Configure as variáveis no arquivo `variables.tf`.
   - Inicialize o Terraform:
     ```bash
     terraform init
     ```
   - Valide e aplique o plano:
     ```bash
     terraform plan
     terraform apply
     ```
   - Após a execução, a máquina virtual será provisionada, o firewall configurado e a aplicação Java instalada.

## Autor

Projeto desenvolvido por Shelldon Ryan.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).