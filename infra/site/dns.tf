resource "aws_route53_record" "new_dns_name" {
  zone_id = "${var.dns_zone_id}"
  name    = "${var.domain_name}"
  type    = "A"
  alias = {
    name                   = "${lower(aws_elb.elb_https.dns_name)}"
    zone_id                = "${aws_elb.elb_https.zone_id}"
    evaluate_target_health = false
  }
}