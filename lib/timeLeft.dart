class TimeLeft {
  List<int> timeLeft(DateTime due) {
    List<int> retVal;

    Duration timeUntilDue = due.difference(DateTime.now());

    int daysUntil = timeUntilDue.inDays;
    int hoursUntil = timeUntilDue.inHours - (daysUntil * 24);
    int minUntil =
        timeUntilDue.inMinutes - (daysUntil * 24 * 60) - (hoursUntil * 60);
    int secUntil = timeUntilDue.inSeconds -
        (daysUntil * 24 * 60 * 60) -
        (hoursUntil * 60 * 60) -
        (minUntil * 60);

    retVal = [daysUntil, hoursUntil, minUntil, secUntil];

    return retVal;
  }
}
