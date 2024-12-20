part of 'stripe_checkout_cubit.dart';

@immutable
sealed class StripeCheckoutState {}

final class StripeCheckoutInitial extends StripeCheckoutState {}

final class StripeCheckoutLoading extends StripeCheckoutState {}

final class StripeCheckoutSuccess extends StripeCheckoutState {}

final class StripeCheckoutFailed extends StripeCheckoutState {
  final String errmassage;

  StripeCheckoutFailed(this.errmassage);
}
