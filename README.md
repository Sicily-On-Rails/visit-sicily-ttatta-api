### API - VISIT SICILY TTATTÀ

## Setup del progetto

### I requisiti preliminari

Verifica che siano installate le versioni corrette di Ruby e Rails. Avrai bisogno di almeno Rails 7.1.3 e Ruby 3.3.0 per la creazione di questo progetto.

```sh
rails -v 
rails 7.1.3
```

```sh
ruby -v
ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [x86_64-darwin19]
```

Come database useremo Sqlite.

### Creazione dell'app Rails
Esegui il comando seguente per creare l'app Rails:

```sh
rails _7.1.3_ new --api --minimal visit-sicily-ttatta-api
```

Le opzioni `--api` e `--minimal` passate a Rails in questo modo renderanno l'applicazione il più piccola possibile, includendo solo le parti che desideriamo e niente che non desideriamo.

### Aggiunta della gemma GraphQL.

La gemma graphql è la gemma per la creazione di API GraphQL all'interno delle applicazioni Ruby. È utilizzata da aziende come Shopify e GitHub.

```sh 
bundle add graphql
```

Una volta installata quella gemma, possiamo eseguire un generatore di Rails fornito dalla gemma stessa. Questo generatore configurerà la struttura GraphQL di cui la nostra applicazione ha bisogno:

```sh
rails g graphql:install
```

Questo generatore genera diversi file differenti.

Per testare la nostra API aggiungiamo la gemma `graphiql-rails`:
```sh
group :development do
  gem 'graphiql-rails'
end
```

### Configurazione di graphiql-rails
Nel file `config\routes.rb` aggiungiamo la seguente istruzione

``` ruby

Rails.application.routes.draw do

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end

  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

end
```

Inoltre se abbiamo creato la nostra applicazione rails con l'instruzione --api, bisogna seguire le seguenti configurazioni:

- Aggiungere  "sprockets/railtie" ad  `application.rb`.

- Creare un file `app/assets/config/manifest.js` ed inseire inserire:

```sh
//= link graphiql/rails/application.css
//= link graphiql/rails/application.js
```