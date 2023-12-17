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
	list!int q = 3;
	q.resize(2); //q = 0, 0
	writeln(q.size); // expects 2
	q.push_back(3); // q = 0,0,3
	q.push_front(6);// q = 6,0,0,3
	writeln(q.size); 
	q.reverse();// q = 3,0,0,6
	writeln(q.front);//expects 3
	writeln(q.back); //expects 6 since q has been reversed
	q.push_front(3); // q = 3,3,0,0,6
	q.push_back(3); //q = 3,3,0,0,6,3 && p = 5,7
	writeln(p.size); // expects 2
	writeln(q.size); // expects 6
	q.swap(p); //q is now = 5,7 && p = 3,3,0,0,6,3
	writeln(p.front); // expects 3
	writeln(q.front); //expects 5, q is now 5,7
	writeln(p.size); // expects 6
	auto N =list!int(p); //copy ctor
	writeln(N.size); // expects 6
	q.sort(); // q = 5,7
	p.sort(); // 0,0,3,3,3,6
	q.merge(p); // q = 0,0,3,3,3,5,6,7
	writeln(q.size); // expects 8
	writeln(q.front); // expects 0


}