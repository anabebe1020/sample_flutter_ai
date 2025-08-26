String formatDateString(String dateString) {
  final date = DateTime.parse(dateString).toLocal();
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '${date.year}/$month/$day';
}
