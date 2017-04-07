module.exports = {
  entry: './lib/delayed_job_dashboard/web/priv/app.js',
  output: {
    filename: './lib/delayed_job_dashboard/web/public/bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.js?$/,
        loader: "babel-loader",
        options: {
          presets: ["es2015"]
        }
      }
    ]
  }
}
