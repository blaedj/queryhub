# QueryHub [![CircleCI](https://circleci.com/gh/kolide/queryhub/tree/master.svg?style=svg)](https://circleci.com/gh/kolide/queryhub/tree/master)

## Developer Commands

### Setup

Run the following to update brew, install elixir, yarn, etc. You should only need to run this once:

```
brew update
brew install elixir yarn
mix local.hex
```

Run the following to install/update Elixir dependencies:

```
mix deps.get
```

Run the following to install/update JavaScript dependencies:

```
cd assets && yarn install
```

### Development Infrastructure

Start the local development infrastructure:

```
docker-compose up -d
```

Run the database migrations:

```
mix ecto.create
mix ecto.migrate
```

### Testing

Run the tests:

```
mix test
```

### Running Locally

Once you have started the development infrastructure and ran the database migrations, run the following to start the Phoenix server:

```
mix phx.server
```

Visit [http://localhost:4000](http://localhost:4000) from the browser.

You can also use `iex` to launch an interactive Elixr REPL:

```
iex -S mix
```

You can set various configurations via local environment variables (e.g. github
app credentials when working on github oauth) in a `.env` file in the root of
the project. Any env vars defined here in the format 
```
FOO=bar
```
will be available via `System.get_env('FOO')` in the application.

### Formatting Your Code

Use `mix format` to format all Elixir code before submitting a Pull Request. Consider using an editor plugin which will format your code on file write.

- Vim users may consider installing the [mhinz/mix-vim-format](https://github.com/mhinz/vim-mix-format) plugin and enabling the `mix_format_on_save` option.
