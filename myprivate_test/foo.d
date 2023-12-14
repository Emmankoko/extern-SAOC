import std.stdio;
import List;
void main()
{
    auto p =list!int(5);
    p.push_back(5);
    writeln(p.front);//expects 0
	p.clear();
	writeln(p.empty);//expects true
	writeln(p.size);//expects 0
	p.push_front(5);
	p.push_front(7);
	writeln(p.size); // expects 2
	writeln(p.front); // expects 7
	writeln(p.back); //expects 5
	writeln(p.empty); //expects false
	p.sort();
	writeln(p.front); //expects 5
	writeln(p.back);//expects 7 now since there's a sort
	list!int q = 7;
	//q.unique();
}