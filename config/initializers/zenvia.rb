Rails.application.config.zenvia_cfg = JSON.parse(
  ENV.fetch('ZENVIA_CFG', '{}')
).with_indifferent_access
