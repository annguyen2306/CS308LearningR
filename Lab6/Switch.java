public class Switch{

    public static void switch_no_return (int x, int y){
        int x_rep = x;
        x = y;
        y = x_rep;
    }

    public static void main(String args[]){
        int a = 1;
        int b = 2;

        switch_no_return(a, b);

        System.out.println("Switch function:");
        System.out.println(a);
        System.out.println(b);

        int temp = a;
        a = b;
        b = temp;

        System.out.println("Switch raw convert:");
        System.out.println(a);
        System.out.println(b);
    }

}

