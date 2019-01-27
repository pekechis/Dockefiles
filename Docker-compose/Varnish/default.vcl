

#---------------------------------------------------------------------
# Definimos para Varnish un backend HTTP (apache en 127.0.0.1:81)
#---------------------------------------------------------------------
vcl 4.0;

import directors;
backend apache1 {
    .host = "172.16.10.10";    
    .probe = {
     .url = "/";
     .timeout = 1s;
     .interval = 5s;
     .window = 5;
     .threshold = 3;
  }

}

backend apache2 {
    .host = "172.16.10.11";    
    .probe = {
     .url = "/";
     .timeout = 1s;
     .interval = 5s;
     .window = 5;
     .threshold = 3;
  }

}

backend apache3 {
    .host = "172.16.10.12";    
    .probe = {
     .url = "/";
     .timeout = 1s;
     .interval = 5s;
     .window = 5;
     .threshold = 3;
  }

}


sub vcl_init {
    new bar = directors.round_robin();
    bar.add_backend(apache1);
    bar.add_backend(apache2);
    bar.add_backend(apache3);
}

sub vcl_recv 
{

    # Especificamos el backend por defecto para esta peticion:
    set req.backend_hint = bar.backend();

        
    # Eliminamos de la peticion HTTP el requerimiento del cliente
    # de usar gzip / deflate / etc (varnish 2.x no lo soporta).
    unset req.http.Accept-Encoding;
 
    # Si la URL de la peticion contiene la regexp ^/images/, tratar
    # de devolverla desde la cache de varnish:
    if (req.url ~ "^/images/") 
    {
        # Eliminamos primero las cookies que nos pueda mandar el cliente
        unset req.http.cookie;
        return(hash);
    }
 
    return(pass);
} 

sub vcl_backend_response
{
    
    if (bereq.url ~ "^/images/") 
    {
        # Eliminamos las cookies que pueda devolver el backend HTTP
        unset beresp.http.Set-Cookie;
 
        # Indicamos que se cachee durante 7 dias:
        set beresp.ttl = 7d;
        
        return(deliver);
    }
}




sub vcl_deliver {
    # Happens when we have all the pieces we need, and are about to send the
    # response to the client.
    #
    # You can do accounting or modifying the final object here.
}


