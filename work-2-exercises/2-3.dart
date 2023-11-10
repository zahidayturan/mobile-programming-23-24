enum Gender { male, female, others }

void main() {
  print('Gender values:');
  Gender.values.forEach((gender) => print(gender));
}