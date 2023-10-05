// method tracing aspect
public aspect TraceAspectVanderboegh {
	
	// slightly modified to be easier to find all instances of getName()
	pointcut classtoTrace(): within(*App) && execution(String getName());
	
	// run before
	before() : classtoTrace() {
		// print the name of the method, and the line the method was called
		System.out.println("[BGN] " + thisJoinPointStaticPart.getSignature()
		+ ", " + thisJoinPointStaticPart.getSourceLocation().getLine());
	}
	
	// run after
	after() : classtoTrace() {
		// print the name of the source file
		System.out.println("[EXIT] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
	}
	
}
