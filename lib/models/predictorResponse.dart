class PredictorResponse {
  String fechaprediccion;
  String horaprediccion;
  String nomett;
  String paradero;
  String respuestaParadero;
  Servicios servicios;
  String urlLinkPublicidad;
  String urlPublicidad;
  String x;
  String y;

  PredictorResponse(
      {this.fechaprediccion,
      this.horaprediccion,
      this.nomett,
      this.paradero,
      this.respuestaParadero,
      this.servicios,
      this.urlLinkPublicidad,
      this.urlPublicidad,
      this.x,
      this.y});

  PredictorResponse.fromJson(Map<String, dynamic> json) {
    fechaprediccion = json['fechaprediccion'];
    horaprediccion = json['horaprediccion'];
    nomett = json['nomett'];
    paradero = json['paradero'];
    respuestaParadero = json['respuestaParadero'];
    servicios = json['servicios'] != null
        ? new Servicios.fromJson(json['servicios'])
        : null;
    urlLinkPublicidad = json['urlLinkPublicidad'];
    urlPublicidad = json['urlPublicidad'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fechaprediccion'] = this.fechaprediccion;
    data['horaprediccion'] = this.horaprediccion;
    data['nomett'] = this.nomett;
    data['paradero'] = this.paradero;
    data['respuestaParadero'] = this.respuestaParadero;
    if (this.servicios != null) {
      data['servicios'] = this.servicios.toJson();
    }
    data['urlLinkPublicidad'] = this.urlLinkPublicidad;
    data['urlPublicidad'] = this.urlPublicidad;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}

class Servicios {
  List<Item> item;

  Servicios({this.item});

  Servicios.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = new List<Item>();
      json['item'].forEach((v) {
        item.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String codigorespuesta;
  String distanciabus1;
  String distanciabus2;
  String horaprediccionbus1;
  String horaprediccionbus2;
  String ppubus1;
  String ppubus2;
  String respuestaServicio;
  String servicio;
  String color;
  String destino;
  String sentido;
  bool itinerario;
  String codigo;

  Item(
      {this.codigorespuesta,
      this.distanciabus1,
      this.distanciabus2,
      this.horaprediccionbus1,
      this.horaprediccionbus2,
      this.ppubus1,
      this.ppubus2,
      this.respuestaServicio,
      this.servicio,
      this.color,
      this.destino,
      this.sentido,
      this.itinerario,
      this.codigo});

  Item.fromJson(Map<String, dynamic> json) {
    codigorespuesta = json['codigorespuesta'];
    distanciabus1 = json['distanciabus1'];
    distanciabus2 = json['distanciabus2'];
    horaprediccionbus1 = json['horaprediccionbus1'];
    horaprediccionbus2 = json['horaprediccionbus2'];
    ppubus1 = json['ppubus1'];
    ppubus2 = json['ppubus2'];
    respuestaServicio = json['respuestaServicio'];
    servicio = json['servicio'];
    color = json['color'];
    destino = json['destino'];
    sentido = json['sentido'];
    itinerario = json['itinerario'];
    codigo = json['codigo'];
  }

  Map<String, dynamic> toJson() {
    var data = new Map<String, dynamic>();
    data['codigorespuesta'] = this.codigorespuesta;
    data['distanciabus1'] = this.distanciabus1;
    data['distanciabus2'] = this.distanciabus2;
    data['horaprediccionbus1'] = this.horaprediccionbus1;
    data['horaprediccionbus2'] = this.horaprediccionbus2;
    data['ppubus1'] = this.ppubus1;
    data['ppubus2'] = this.ppubus2;
    data['respuestaServicio'] = this.respuestaServicio;
    data['servicio'] = this.servicio;
    data['color'] = this.color;
    data['destino'] = this.destino;
    data['sentido'] = this.sentido;
    data['itinerario'] = this.itinerario;
    data['codigo'] = this.codigo;
    return data;
  }
}
