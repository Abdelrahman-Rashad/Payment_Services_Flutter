abstract class Failure {
  final String errmassagel;

  Failure(this.errmassagel);
}

class ServierFailure extends Failure {
  ServierFailure(super.errmassagel);
}
