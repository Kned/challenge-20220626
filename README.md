# Challenge 20220626

- Este projeto disponibiliza algumas informacões sobre produtos extraidos do https://world.openfoodfacts.org/ em uma simples api REST
- Também possui um cron que faz diáriamente atualização dos produtos importados.

# Tecnologias Utilizadas

- Ruby 3.1.2
- Rails 7
- Sidekiq
- Sidekiq-Scheduler
- Redis

# Dependencias

- Ruby 3.1.2p20
- MongoDB 4.4.4
- Redis Server 7.0.11

# Instalação

- $bundle install
- $bundle exec rake database:import
- $rails spec

# Rodando Projeto

- $bundle exec sidekiq
- $rails s
- Documentçcão acesse http://localhost:3000/api-docs/index.html

This is a challenge by Coodesh
