// Java class go.GopherKit.GopherKit is a proxy for talking to a Go program.
//   gobind -lang=java github.com/tomasen/gomobile-demo/sdk
//
// File is generated by gobind. Do not edit.
package go.GopherKit;

import go.Seq;

public abstract class GopherKit {
    private GopherKit() {} // uninstantiable
    
    public interface Callback extends go.Seq.Object {
        public void StateDidUpdate();
        
        public static abstract class Stub implements Callback {
            static final String DESCRIPTOR = "go.GopherKit.Callback";
            
            private final go.Seq.Ref ref;
            public Stub() {
                ref = go.Seq.createRef(this);
            }
            
            public go.Seq.Ref ref() { return ref; }
            
            public void call(int code, go.Seq in, go.Seq out) {
                switch (code) {
                case Proxy.CALL_StateDidUpdate: {
                    this.StateDidUpdate();
                    return;
                }
                default:
                    throw new RuntimeException("unknown code: "+ code);
                }
            }
        }
        
        static final class Proxy implements Callback {
            static final String DESCRIPTOR = Stub.DESCRIPTOR;
        
            private go.Seq.Ref ref;
        
            Proxy(go.Seq.Ref ref) { this.ref = ref; }
        
            public go.Seq.Ref ref() { return ref; }
        
            public void call(int code, go.Seq in, go.Seq out) {
                throw new RuntimeException("cycle: cannot call proxy");
            }
        
            public void StateDidUpdate() {
                go.Seq _in = null;
                go.Seq _out = null;
                _in = new go.Seq();
                _in.writeRef(ref);
                Seq.send(DESCRIPTOR, CALL_StateDidUpdate, _in, _out);
            }
            
            static final int CALL_StateDidUpdate = 0x10a;
        }
    }
    
    public static State GetState() {
        go.Seq _in = null;
        go.Seq _out = null;
        _out = new go.Seq();
        State _result;
        Seq.send(DESCRIPTOR, CALL_GetState, _in, _out);
        _result = new State(_out.readRef());
        return _result;
    }
    
    public static void RegisterCallback(Callback c) {
        go.Seq _in = null;
        go.Seq _out = null;
        _in = new go.Seq();
        _in.writeRef(c.ref());
        Seq.send(DESCRIPTOR, CALL_RegisterCallback, _in, _out);
    }
    
    public static void Start() {
        go.Seq _in = null;
        go.Seq _out = null;
        Seq.send(DESCRIPTOR, CALL_Start, _in, _out);
    }
    
    public static final class State implements go.Seq.Object {
        private static final String DESCRIPTOR = "go.GopherKit.State";
        private static final int FIELD_NanoTimeStamp_GET = 0x00f;
        private static final int FIELD_NanoTimeStamp_SET = 0x01f;
        private static final int FIELD_Message_GET = 0x10f;
        private static final int FIELD_Message_SET = 0x11f;
        
        private go.Seq.Ref ref;
        
        private State(go.Seq.Ref ref) { this.ref = ref; }
        
        public go.Seq.Ref ref() { return ref; }
        
        public void call(int code, go.Seq in, go.Seq out) {
            throw new RuntimeException("internal error: cycle: cannot call concrete proxy");
        }
        
        public long getNanoTimeStamp() {
            Seq in = new Seq();
            Seq out = new Seq();
            in.writeRef(ref);
            Seq.send(DESCRIPTOR, FIELD_NanoTimeStamp_GET, in, out);
            return out.readInt64();
        }
        
        public void setNanoTimeStamp(long v) {
            Seq in = new Seq();
            in.writeRef(ref);
            in.writeInt64(v);
            Seq.send(DESCRIPTOR, FIELD_NanoTimeStamp_SET, in, null);
        }
        
        public String getMessage() {
            Seq in = new Seq();
            Seq out = new Seq();
            in.writeRef(ref);
            Seq.send(DESCRIPTOR, FIELD_Message_GET, in, out);
            return out.readString();
        }
        
        public void setMessage(String v) {
            Seq in = new Seq();
            in.writeRef(ref);
            in.writeString(v);
            Seq.send(DESCRIPTOR, FIELD_Message_SET, in, null);
        }
        
        @Override public boolean equals(Object o) {
            if (o == null || !(o instanceof State)) {
                return false;
            }
            State that = (State)o;
            long thisNanoTimeStamp = getNanoTimeStamp();
            long thatNanoTimeStamp = that.getNanoTimeStamp();
            if (thisNanoTimeStamp != thatNanoTimeStamp) {
                return false;
            }
            String thisMessage = getMessage();
            String thatMessage = that.getMessage();
            if (thisMessage == null) {
                if (thatMessage != null) {
                    return false;
                }
            } else if (!thisMessage.equals(thatMessage)) {
                return false;
            }
            return true;
        }
        
        @Override public int hashCode() {
            return java.util.Arrays.hashCode(new Object[] {getNanoTimeStamp(), getMessage()});
        }
        
        @Override public String toString() {
            StringBuilder b = new StringBuilder();
            b.append("State").append("{");
            b.append("NanoTimeStamp:").append(getNanoTimeStamp()).append(",");
            b.append("Message:").append(getMessage()).append(",");
            return b.append("}").toString();
        }
        
    }
    
    private static final int CALL_GetState = 1;
    private static final int CALL_RegisterCallback = 2;
    private static final int CALL_Start = 3;
    private static final String DESCRIPTOR = "GopherKit";
}
