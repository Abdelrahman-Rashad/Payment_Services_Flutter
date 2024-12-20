import 'dart:convert';

import 'amount_details.dart';
import 'automatic_payment_methods.dart';
import 'metadata.dart';
import 'payment_method_options.dart';

class PaymentIntentModel {
  String? id;
  String? object;
  int? amount;
  int? amountCapturable;
  AmountDetails? amountDetails;
  int? amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  AutomaticPaymentMethods? automaticPaymentMethods;
  dynamic canceledAt;
  dynamic cancellationReason;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  dynamic customer;
  dynamic description;
  dynamic invoice;
  dynamic lastPaymentError;
  dynamic latestCharge;
  bool? livemode;
  Metadata? metadata;
  dynamic nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;
  PaymentMethodOptions? paymentMethodOptions;
  List<dynamic>? paymentMethodTypes;
  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  PaymentIntentModel({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountDetails,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    this.livemode,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory PaymentIntentModel.fromMap(Map<String, dynamic> data) {
    return PaymentIntentModel(
      id: data['id'] as String?,
      object: data['object'] as String?,
      amount: data['amount'] as int?,
      amountCapturable: data['amount_capturable'] as int?,
      amountDetails: data['amount_details'] == null
          ? null
          : AmountDetails.fromMap(
              data['amount_details'] as Map<String, dynamic>),
      amountReceived: data['amount_received'] as int?,
      application: data['application'] as dynamic,
      applicationFeeAmount: data['application_fee_amount'] as dynamic,
      automaticPaymentMethods: data['automatic_payment_methods'] == null
          ? null
          : AutomaticPaymentMethods.fromMap(
              data['automatic_payment_methods'] as Map<String, dynamic>),
      canceledAt: data['canceled_at'] as dynamic,
      cancellationReason: data['cancellation_reason'] as dynamic,
      captureMethod: data['capture_method'] as String?,
      clientSecret: data['client_secret'] as String?,
      confirmationMethod: data['confirmation_method'] as String?,
      created: data['created'] as int?,
      currency: data['currency'] as String?,
      customer: data['customer'] as dynamic,
      description: data['description'] as dynamic,
      invoice: data['invoice'] as dynamic,
      lastPaymentError: data['last_payment_error'] as dynamic,
      latestCharge: data['latest_charge'] as dynamic,
      livemode: data['livemode'] as bool?,
      metadata: data['metadata'] == null
          ? null
          : Metadata.fromMap(data['metadata'] as Map<String, dynamic>),
      nextAction: data['next_action'] as dynamic,
      onBehalfOf: data['on_behalf_of'] as dynamic,
      paymentMethod: data['payment_method'] as dynamic,
      paymentMethodOptions: data['payment_method_options'] == null
          ? null
          : PaymentMethodOptions.fromMap(
              data['payment_method_options'] as Map<String, dynamic>),
      paymentMethodTypes: data['payment_method_types'] as List<dynamic>?,
      processing: data['processing'] as dynamic,
      receiptEmail: data['receipt_email'] as dynamic,
      review: data['review'] as dynamic,
      setupFutureUsage: data['setup_future_usage'] as dynamic,
      shipping: data['shipping'] as dynamic,
      source: data['source'] as dynamic,
      statementDescriptor: data['statement_descriptor'] as dynamic,
      statementDescriptorSuffix: data['statement_descriptor_suffix'] as dynamic,
      status: data['status'] as String?,
      transferData: data['transfer_data'] as dynamic,
      transferGroup: data['transfer_group'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'object': object,
        'amount': amount,
        'amount_capturable': amountCapturable,
        'amount_details': amountDetails?.toMap(),
        'amount_received': amountReceived,
        'application': application,
        'application_fee_amount': applicationFeeAmount,
        'automatic_payment_methods': automaticPaymentMethods?.toMap(),
        'canceled_at': canceledAt,
        'cancellation_reason': cancellationReason,
        'capture_method': captureMethod,
        'client_secret': clientSecret,
        'confirmation_method': confirmationMethod,
        'created': created,
        'currency': currency,
        'customer': customer,
        'description': description,
        'invoice': invoice,
        'last_payment_error': lastPaymentError,
        'latest_charge': latestCharge,
        'livemode': livemode,
        'metadata': metadata?.toMap(),
        'next_action': nextAction,
        'on_behalf_of': onBehalfOf,
        'payment_method': paymentMethod,
        'payment_method_options': paymentMethodOptions?.toMap(),
        'payment_method_types': paymentMethodTypes,
        'processing': processing,
        'receipt_email': receiptEmail,
        'review': review,
        'setup_future_usage': setupFutureUsage,
        'shipping': shipping,
        'source': source,
        'statement_descriptor': statementDescriptor,
        'statement_descriptor_suffix': statementDescriptorSuffix,
        'status': status,
        'transfer_data': transferData,
        'transfer_group': transferGroup,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentIntentModel].
  factory PaymentIntentModel.fromJson(Map<String, dynamic> data) {
    return PaymentIntentModel.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentIntentModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
