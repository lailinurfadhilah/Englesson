class ModelMateri {
  int? id;
  String? name;
  String? pengertian;
  String? rumus;
  String? rumusp;
  String? rumusm;
  String? rumust;
  String? contoh;
  String? contohp;
  String? contohm;
  String? contoht;

  ModelMateri(
      this.id,
      this.name,
      this.pengertian,
      this.rumusp,
      this.rumusm,
      this.rumust,
      this.contohm,
      this.contohp,
      this.contoht,
      this.contoh,
      this.rumus);

  ModelMateri.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pengertian = json['pengertian'];
    rumus = json['rumus'];
    rumusp = json['rumusp'];
    rumusm = json['rumusm'];
    rumust = json['rumust'];
    contoh = json['contoh'];
    contohp = json['contohp'];
    contohm = json['contohm'];
    contoht = json['contoht'];
  }
}
