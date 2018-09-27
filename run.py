import starter_pack.app

app = starter_pack.app.create_app()
app.run('0.0.0.0', port=5200, debug=True)
