import java.util.*;

public class CourseRegistrationApp {
    private static final Scanner input = new Scanner(System.in);
    private static final List<Course> courses = new ArrayList<>(List.of(
        new Course("CSC201", "Object-Oriented Programming", "Dr. Dlamini", "Mon", "09:00", 40, 36),
        new Course("WEB210", "Web Application Development", "Ms. Naidoo", "Tue", "11:00", 35, 21),
        new Course("DBS220", "Database Systems", "Mr. Botha", "Wed", "13:00", 30, 30),
        new Course("ALG230", "Algorithms and Data Structures", "Dr. Khan", "Mon", "09:00", 35, 28)
    ));
    private static final List<Course> schedule = new ArrayList<>();

    public static void main(String[] args) {
        System.out.println("\n=== CAMPUSCONNECT COURSE REGISTRATION ===");
        boolean running = true;
        while (running) {
            System.out.println("\n1. Browse courses  2. Search courses  3. Register  4. My schedule  0. Exit");
            switch (input.nextLine()) { case "1" -> list(courses); case "2" -> search(); case "3" -> register(); case "4" -> list(schedule); case "0" -> running = false; default -> System.out.println("Choose a valid option."); }
        }
        System.out.println("Goodbye. Your changes were stored for this session.");
    }

    private static void list(List<Course> list) {
        if (list.isEmpty()) { System.out.println("No courses found."); return; }
        list.forEach(c -> System.out.printf("%-7s %-32s %-16s %s %s | %d/%d places%n", c.code(), c.title(), c.lecturer(), c.day(), c.time(), c.enrolled(), c.capacity()));
    }
    private static void search() { System.out.print("Search by code or title: "); String q = input.nextLine().toLowerCase(); list(courses.stream().filter(c -> (c.code()+c.title()).toLowerCase().contains(q)).toList()); }
    private static void register() {
        System.out.print("Enter course code: "); String code = input.nextLine().toUpperCase();
        Course course = courses.stream().filter(c -> c.code().equals(code)).findFirst().orElse(null);
        if (course == null) { System.out.println("Course not found."); return; }
        if (schedule.stream().anyMatch(c -> c.code().equals(code))) { System.out.println("You are already registered for this course."); return; }
        if (course.isFull()) { System.out.println("Registration blocked: this course is full."); return; }
        if (schedule.stream().anyMatch(c -> c.day().equals(course.day()) && c.time().equals(course.time()))) { System.out.println("Registration blocked: timetable conflict with " + schedule.stream().filter(c -> c.day().equals(course.day()) && c.time().equals(course.time())).findFirst().get().code()); return; }
        courses.set(courses.indexOf(course), course.enroll()); schedule.add(course.enroll()); System.out.println("Registered successfully for " + course.code() + ".");
    }
}
