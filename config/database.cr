database_name = "tiny_api_#{Lucky::Env.name}"

Avram::Repo.configure do |settings|
  if Lucky::Env.production?
    settings.url = ENV.fetch("DATABASE_URL")
  else
    settings.url = ENV["DATABASE_URL"]? || Avram::PostgresURL.build(
      database: database_name,
      hostname: ENV["DB_HOST"]? || "localhost",
    )
  end
  # In development and test, raise an error if you forget to preload associations
  settings.lazy_load_enabled = Lucky::Env.production?
end
