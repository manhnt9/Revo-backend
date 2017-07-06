module ErrorFormatter
  def self.call message, _backtrace, _options, _env
    {
      "error_code" => message["error_code".to_sym],
      "message" => message["message".to_sym]
    }.to_json
  end
end
