import java.io.File;
import java.util.ArrayList;




public class Test {

	private static String TOP = "type T_DATA is array (0 to %s) of std_logic_vector(7 downto 0);\n"
			+ "constant DATA : T_DATA :=\n"
            + "	(";
	private static String BOT = "type T_RESULT is array (0 to %s) of STD_LOGIC;\n"
			+ "constant RESULT : T_RESULT :=\n"
			+ "	(";

	public static void main(String[] args) {
		System.out.println();
		String name = "D:\\test.h";
		String result = FileUtility.readFromFile(new File(name)).toString().trim();

		String commented = result.replaceAll("\\n", "\n--").replaceAll("^", "--");
		System.out.println(commented);

		System.out.print(String.format(TOP, result.length() - 1));
		String prefix = "";

		ArrayList<Integer> expected = new ArrayList<>();

		for (char c : result.toCharArray()) {
			String g = conv(c);
			int k = go(c);
			expected.add(k);

			System.out.print(prefix + "\"" + g + "\"");
			prefix = ",";
		}
		System.out.println(");\n");
		System.out.print(String.format(BOT, result.length() - 1));

		prefix = "";
		for (int i : expected) {
			System.out.print(prefix + "'" + i + "'");
			prefix = ",";
		}
		System.out.println(");");
	}

	private static String conv(char c) {
	 	int t = c;
	 	String out = Integer.toBinaryString(t);
	 	return ensureLen(out);
	}

	private static final int ONE = 1;
	private static final int ZERO = 0;
	private static final char SLASH = '/';
	private static final char STAR = '*';
	private static final char NEW = '\n';

	private static final int A = 0;
	private static final int B = 1;
	private static final int C = 2;
	private static final int D = 3;
	private static final int E = 4;
	private static int state = A;

	private static int go(char c) {
		if (state == A) {
			if (c == SLASH) {
				state = B;
			}
			return ZERO;
		} else if (state == B) {
			if (c == SLASH) {
				state = C;
			} else if (c == STAR) {
				state = D;
			} else {
				state = A;
			}
			return ZERO;
		} else if (state == C) {
			if (c == NEW) {
				state = A;
			}
			return ONE;
		} else if (state == D) {
			if (c == STAR) {
				state = E;
			}
			return ONE;
		} else if (state == E) {
			if (c == STAR) {

			} else if (c == SLASH) {
				state = A;
			} else {
				state = D;
			}
			return ONE;
		} else {
			throw new IllegalStateException("ZZ");
		}
	}

	private static String ensureLen(String x) {
		StringBuffer out = new StringBuffer(x);
		if (x.length() < 8) {
			int l = x.length();
			for (int i =0 ; i < 8-l; i++) {
				out.insert(0, '0');
			}
		}
		return out.toString();
	}
}
