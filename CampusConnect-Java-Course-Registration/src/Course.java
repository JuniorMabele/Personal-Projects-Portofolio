public record Course(String code, String title, String lecturer, String day, String time, int capacity, int enrolled) {
    public boolean isFull() { return enrolled >= capacity; }
    public Course enroll() { return new Course(code, title, lecturer, day, time, capacity, enrolled + 1); }
}
