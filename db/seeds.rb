# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

services = [
    'lavastoviglie', 'lavatrice', 'asciugatrice', 'microonde', 'forno',
    'frigo', 'vasca', 'tv', 'computer', 'telefono', 'condizionatore',
    'riscaldamento', 'balcone', 'giardino', 'pulizia', 'portiere',
    'bicicletta', 'parcheggio', 'camino', 'ascensore', 'barbecue',
    'piscina', 'svago', 'disabili'
  ]
  
  services.each do |service|
    Service.find_or_create_by(nome: service)
  end

  User.create!(
    name: "Admin User",
    email: "admin@prova.it",
    password: "asd",
    user_type: "admin",
    confirmed_at: Time.now # Imposta il campo confirmed_at con l'istante corrente
  )
  
  puts "Admin user created successfully."
