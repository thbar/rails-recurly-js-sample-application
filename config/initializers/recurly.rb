# For now, bypass during specs to keep Travis happy
unless Rails.env.test?
  config = YAML.load(IO.read(Rails.root.join('config', 'settings.yml')))

  Recurly.api_key          = config['recurly']['api_key']
  Recurly.js.private_key   = config['recurly']['js_private_key']
  Recurly.subdomain        = config['recurly']['subdomain']
end