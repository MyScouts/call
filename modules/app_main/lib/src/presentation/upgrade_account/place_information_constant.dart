import '../../domain/entities/update_account/place/country.dart';

enum PlaceInformationType {
  country,
  province,
  district,
  ward,
}

List<Country> countries = [
  const Country(name: 'Vietnam', iso2: 'vn'),
];


final ekycInfo = {
  "access_token":"bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwOWRiNzJjMi1iOTVkLTQ0MGYtZTA2My02MzE5OWYwYTg0ZDYiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoibmdvY3NwYXJjazYyQGdtYWlsLmNvbSIsInNjb3BlIjpbInJlYWQiXSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3QiLCJuYW1lIjoibmdvY3NwYXJjazYyQGdtYWlsLmNvbSIsInV1aWRfYWNjb3VudCI6IjA5ZGI3MmMyLWI5NWQtNDQwZi1lMDYzLTYzMTk5ZjBhODRkNiIsImF1dGhvcml0aWVzIjpbIlVTRVIiXSwianRpIjoiYzViNGQ5MzktNzM1Mi00ZGU2LWE2YzktYTkxNzE4ZGMyZDA2IiwiY2xpZW50X2lkIjoiYWRtaW5hcHAifQ.33BqAeV-HkkkmligfWJeMmRmmUElrdl9t1fms2oZCowXtuDGYPj7VyVX9T0xB-oufUXlmuFK9X0HQztcGcasvyItCiYkOsiyzCx0mlzeVVSanU0I6xLFvsNEcnof9dvZc-udyi_Ce_NqZG_EEZkjCf6SvKkTayayZJ99jjk_FlH1aW2xMDqvhhIuEJHzy_O5vnxxW11w95C8bgoptd3ppHkyArVVUkma3CZOz1Nkjfeq3eE1lKOY1qbCIw7BO9tSoHOdW5p_oLzwJYO1vdFls_H_dap_z-iRT4xsqqwkPcCGahuM0NxIQjHLGwll2wjq3MIgMoS3HnK_ut5YMDbMog",
  "token_id": "09db74a3-6dee-660e-e063-62199f0a105b",
  "token_key":
  "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAOXwCIv6I123QcLFtkHneykT+pj2Xe+2Ji2HaLCHMoekh4t1qHWL7qOyS75EKASeUphvu1Nn752dQI6laGMleA8CAwEAAQ==",
  "is_enable_compare": true,
};
