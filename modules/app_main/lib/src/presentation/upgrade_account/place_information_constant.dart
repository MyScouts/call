import 'package:app_main/src/domain/entities/update_account/place/district.dart';
import 'package:app_main/src/domain/entities/update_account/place/province.dart';
import 'package:app_main/src/domain/entities/update_account/place/ward.dart';
import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';

import '../../domain/entities/update_account/place/country.dart';

enum PlaceInformationType {
  country,
  province,
  district,
  ward,
}

List<Gender> genders = [
  const Gender(key: 1, value: 'Nam'),
  const Gender(key: 0, value: 'Nữ'),
  const Gender(key: 2, value: 'Khác'),
];

List<Country> countries = [
  const Country(id: 240, name: 'Việt Nam', iso2: 'vn'),
];

List<Province> provinces = [
  const Province(name: 'Thành phố Hà Nội', stateCode: 1),
  const Province(name: 'Tỉnh Hà Giang', stateCode: 2),
  const Province(name: 'Tỉnh Cao Bằng', stateCode: 3),
  const Province(name: 'Tỉnh Bắc Kạn', stateCode: 4),
  const Province(name: 'Tỉnh Tuyên Quang', stateCode: 5),
  const Province(name: 'Tỉnh Lào Cai', stateCode: 6),
  const Province(name: 'Tỉnh Điện Biên', stateCode: 7),
  const Province(name: 'Tỉnh Lai Châu', stateCode: 8),
  const Province(name: 'Tỉnh Sơn La', stateCode: 9),
  const Province(name: 'Tỉnh Yên Bái', stateCode: 10),
  const Province(name: 'Tỉnh Hoà Bình', stateCode: 11),
  const Province(name: 'Tỉnh Thái Nguyên', stateCode: 12),
  const Province(name: 'Tỉnh Lạng Sơn', stateCode: 13),
  const Province(name: 'Tỉnh Quảng Ninh', stateCode: 14),
  const Province(name: 'Tỉnh Bắc Giang', stateCode: 15),
  const Province(name: 'Tỉnh Phú Thọ', stateCode: 16),
  const Province(name: 'Tỉnh Vĩnh Phúc', stateCode: 17),
  const Province(name: 'Tỉnh Bắc Ninh', stateCode: 18),
  const Province(name: 'Tỉnh Hải Dương', stateCode: 19),
  const Province(name: 'Thành phố Hải Phòng', stateCode: 20),
  const Province(name: 'Tỉnh Hưng Yên', stateCode: 21),
  const Province(name: 'Tỉnh Thái Bình', stateCode: 22),
  const Province(name: 'Tỉnh Hà Nam', stateCode: 23),
  const Province(name: 'Tỉnh Nam Định', stateCode: 24),
  const Province(name: 'Tỉnh Ninh Bình', stateCode: 25),
  const Province(name: 'Tỉnh Thanh Hoá', stateCode: 26),
  const Province(name: 'Tỉnh Nghệ An', stateCode: 27),
  const Province(name: 'Tỉnh Hà Tĩnh', stateCode: 28),
  const Province(name: 'Tỉnh Quảng Bình', stateCode: 29),
  const Province(name: 'Tỉnh Quảng Trị', stateCode: 30),
  const Province(name: 'Tỉnh Thừa Thiên Huế', stateCode: 31),
  const Province(name: 'Thành phố Đà Nẵng"', stateCode: 32),
  const Province(name: 'Tỉnh Quảng Nam', stateCode: 33),
  const Province(name: 'Tỉnh Quảng Ngãi', stateCode: 34),
  const Province(name: 'Tỉnh Bình Định', stateCode: 35),
  const Province(name: 'Tỉnh Phú Yên', stateCode: 36),
  const Province(name: 'Tỉnh Khánh Hoà', stateCode: 37),
  const Province(name: 'Tỉnh Ninh Thuận', stateCode: 38),
  const Province(name: 'Tỉnh Bình Thuận', stateCode: 39),
  const Province(name: 'Tỉnh Kon Tum', stateCode: 40),
  const Province(name: 'Tỉnh Gia Lai', stateCode: 41),
  const Province(name: 'Tỉnh Đắk Lắk', stateCode: 42),
  const Province(name: 'Tỉnh Đắk Nông', stateCode: 43),
  const Province(name: 'Tỉnh Lâm Đồng', stateCode: 44),
  const Province(name: 'Tỉnh Bình Phước', stateCode: 45),
  const Province(name: 'Tỉnh Tây Ninh', stateCode: 46),
  const Province(name: 'Tỉnh Bình Dương', stateCode: 47),
  const Province(name: 'Tỉnh Đồng Nai', stateCode: 48),
  const Province(name: 'Tỉnh Bà Rịa - Vũng Tàu', stateCode: 49),
  const Province(name: 'Thành phố Hồ Chí Minh', stateCode: 50),
  const Province(name: 'Tỉnh Long An', stateCode: 51),
  const Province(name: 'Tỉnh Tiền Giang', stateCode: 52),
  const Province(name: 'Tỉnh Bến Tre', stateCode: 53),
  const Province(name: 'Tỉnh Trà Vinh', stateCode: 54),
  const Province(name: 'Tỉnh Vĩnh Long', stateCode: 55),
  const Province(name: 'Tỉnh Đồng Tháp', stateCode: 56),
  const Province(name: 'Tỉnh An Giang', stateCode: 57),
  const Province(name: 'Tỉnh Kiên Giang', stateCode: 58),
  const Province(name: 'Thành phố Cần Thơ', stateCode: 59),
  const Province(name: 'Tỉnh Hậu Giang', stateCode: 60),
  const Province(name: 'Tỉnh Sóc Trăng', stateCode: 61),
  const Province(name: 'Tỉnh Bạc Liêu', stateCode: 62),
  const Province(name: 'Tỉnh Cà Mau', stateCode: 63),
];

List<District> districts = [
  const District(name: 'Quận 1', code: '545'),
  const District(name: 'Quận 12', code: '546'),
  const District(name: 'Quận Gò Vấp', code: '547'),
  const District(name: 'Quận Bình Thạnh', code: '548'),
  const District(name: 'Quận Tân Bình', code: '549'),
  const District(name: 'Quận Tân Phú', code: '550'),
  const District(name: 'Quận Phú Nhuận', code: '551'),
  const District(name: 'Thành phố Thủ Đức', code: '552'),
  const District(name: 'Quận 3', code: '553'),
  const District(name: 'Quận 10', code: '554'),
  const District(name: 'Quận 11', code: '555'),
  const District(name: 'Quận 4', code: '556'),
  const District(name: 'Quận 5', code: '557'),
  const District(name: 'Quận 6', code: '558'),
  const District(name: 'Quận 8', code: '559'),
  const District(name: 'Quận Bình Tân', code: '560'),
  const District(name: 'Quận 7', code: '561'),
  const District(name: 'Huyện Củ Chi', code: '562'),
  const District(name: 'Huyện Hóc Môn', code: '563'),
  const District(name: 'Huyện Bình Chánh', code: '564'),
  const District(name: 'Huyện Nhà Bè', code: '565'),
  const District(name: 'Huyện Cần Giờ', code: '566'),
];

List<Ward> wards = [
  const Ward(name: 'Phường Hiệp Tân', id: 8764),
  const Ward(name: 'Phường Hoà Thạnh', id: 8763),
  const Ward(name: 'Phường Phú Thạnh', id: 8761),
  const Ward(name: 'Phường Phú Thọ Hoà', id: 8760),
  const Ward(name: 'Phường Phú Trung', id: 8762),
  const Ward(name: 'Phường Sơn Kỳ', id: 8757),
  const Ward(name: 'Phường Tân Quý', id: 8758),
  const Ward(name: 'Phường Tân Sơn Nhì', id: 8755),
  const Ward(name: 'Phường Tân Thành', id: 8759),
  const Ward(name: 'Phường Tân Thới Hoà', id: 8765),
  const Ward(name: 'Phường Tây Thạnh', id: 8756),
];

final ekycInfo = {
  "access_token": "bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwYWZlMzQzZi0zMjBjLTVkMGMtZTA2My02MjE5OWYwYTdiMTYiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoibmdvY3BoYW05OUB2aW5haG91c2UuYXVkaW8iLCJzY29wZSI6WyJyZWFkIl0sImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0IiwibmFtZSI6Im5nb2NwaGFtOTlAdmluYWhvdXNlLmF1ZGlvIiwidXVpZF9hY2NvdW50IjoiMGFmZTM0M2YtMzIwYy01ZDBjLWUwNjMtNjIxOTlmMGE3YjE2IiwiYXV0aG9yaXRpZXMiOlsiVVNFUiJdLCJqdGkiOiJhMzA2ZWFlZC00MWM0LTQ0MmQtOGZlOS05NzBlYzhiYjhjMjIiLCJjbGllbnRfaWQiOiJhZG1pbmFwcCJ9.Imjj11l4mRxdaM3nfYUtwxrOIT-Wa8_fCsxcjPxcmxrccK4O-PYEkoWtP4-1xSdkgSwujIaHSXCoEoBaYgsgXgSOjQmWKaH66KggPjs--fMVGFQR64noJMirN6UQoFmh_JmqmTBEWOKctxE3iYyzPSbZM0CIT4GjM4-g2wD5cxZCdan89MYfh_LI143MP-j76eMywG4O4nQAZv4qxfTxji186o8UALQx-M-TD0Zr8_FLC4q675jOPMhpZRN0_aWDmivQrTx1IgCt7hpoollH5pSnMhn7RxttpsqyBHn79f90evxqW2rJUTwVGhrDFrAZt8mH2JRvr-He5kGI9sS8tQ",
  "token_id": "0afe3791-6c5a-65ea-e063-63199f0a8677",
  "token_key":
      "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAMZTiwmZlnBvhhxn7GNDu8F7qkR73i0q36BIRdkRXNYQzkj+UMDYOughU9c0EqBx/r+WAaTEDPGwzS31RKFV1McCAwEAAQ==",
};
