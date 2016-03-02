class Sleeper
  @queue = :sleep

  def self.perform(seconds)
   sleep(seconds)
   RestClient.post "https://api:key-e7d79c66e74391fdf48b657624f23ddc@api.mailgun.net/v3/sandboxb9c2dadab0ea49f6b7130d1091646c59.mailgun.org/messages",
		    :from => "Pronostic - Cierre de Mes <mailgun@sandboxb9c2dadab0ea49f6b7130d1091646c59.mailgun.org>",
		    :to => "juancarlos.santiago@vianse.mx",
		    :subject => "Cierre de Mes",
		    :html => "<h1>Has recibido una nueva factura por el negocio Pizza PePe SA de CV</h1>"
  end
end