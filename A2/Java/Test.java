import java.util.Random;



class Test {

	private static final String TEMPLATE = ""
			+ "	s_a <= %s;\n"
			+ "	s_b <= %s;\n"
			+ "	s_c <= %s;\n"
			+ "	s_d <= %s;\n"
			+ "	s_e <= %s;\n"
			+ "\n"
			+ "	WAIT FOR 3 * clk_period;\n"
			+ "	ASSERT (s_op1 = %s) REPORT \"s_op1 not %s\" SEVERITY ERROR;\n"
			+ "	ASSERT (s_op3 = %s) REPORT \"s_op3 not %s\" SEVERITY ERROR;\n"
			+ "	ASSERT (s_op4 = %s) REPORT \"s_op4 not %s\" SEVERITY ERROR;\n"
			+ "	ASSERT (s_op2 = %s) REPORT \"s_op2 not %s\" SEVERITY ERROR;\n"
			+ "	ASSERT (s_op5 = %s) REPORT \"s_op5 not %s\" SEVERITY ERROR;\n"
			+ "\n"
			+ "	ASSERT (s_final_output = %s) REPORT \"Final result is not %s\" SEVERITY ERROR;\n"
			+ "	REPORT \"The value of 's_final_output' is \" & integer'image(s_final_output);\n"
			+ "	REPORT \"***************************************************************\";\n";

	public static void main(String[] args) {
		Random r = new Random(System.currentTimeMillis());
		final int range = 4;

		for (int i = 0; i < 5; i++) {
			int[] test = new int[5];
			for (int j = 0; j < 5; j++) {
				test[j] = r.nextInt(range) - (range/2);
			}

			gogo(test);
		}
	}

	public static void gogo(int[] test) {
		int op1 = test[0] + test[1];
		int op2 = op1 * 42;
		int op3 = test[2] * test[3];
		int op4 = test[0] - test[4];
		int op5 = op3 * op4;
		int res = op2 - op5;

		System.out.println(String.format(TEMPLATE, test[0], test[1],test[2],test[3],test[4],
											op1, op1,
											op3, op3,
											op4, op4,
											op2, op2,
											op5, op5,
											res, res));
	}

	public static int go(int a, int b, int c, int d, int e) {
		return (a + b) * 42 - (c * d * (a - e));
	}

}