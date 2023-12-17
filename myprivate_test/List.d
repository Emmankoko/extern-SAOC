module List;

import core.stdcpp.allocator;
import core.stdcpp.xutility : StdNamespace;
alias listNamespace = StdNamespace;
extern(C++, (listNamespace)):
	

alias list(Type) = list!(Type, allocator!Type);
extern(C++, class) struct list(Type, Allocator)
{
	static assert(!is(Type == bool), " list not required to have specialization for bool");


	//MEMBER TYPES

	alias value_type = Type;

	alias allocator_type = Allocator;

	alias size_type = size_t;

	alias pointer = Type*;

	alias const_pointer = const(Type)*;

	alias difference_type = ptrdiff_t;

	//references can't be aliased,'ref' has no effect in type aliases

	//MEMBER FUNCTIONS
	ref list opAssign();

	@disable this();

			 //allocator ctor
			this(ref const allocator!Type);

			//copy ctor
			this(ref const list);

			 //list(n,value) ctor
			this(size_type __n, ref const value_type value, ref const allocator!Type);

			extern(D) this(size_type n, const value_type element)
			{
				allocator!Type alloc_instance = allocator!(Type).init;
				this(n, element, alloc_instance);
			}

			this(ref const list!Type other, ref const allocator!Type);

			//list(n) ctor
			this(size_type __n, ref const allocator!Type);


			this(size_type n);

			~this();

			extern(D) void assign(size_type n, const value_type item)
			{
				this.assign(n, item);
			}

			extern(D) void push_back(const Type item)
			{
				this.push_back(item);
			}

			extern(D) void push_front(const Type item)
			{
				this.push_front(item);
			}

			extern(D) void resize(size_type n, const value_type item)
			{
				this.resize(n, item);
			}

			extern(D) size_type remove(const value_type item)
			{
				return this.remove(item);
			}

			ref list opAssign(ref const list!Type other);

			void assign(size_type count, ref const value_type value);

			//const nothrow since C++11
			allocator_type get_allocator() const nothrow;

			ref value_type front();

			ref value_type back();

			pointer begin() nothrow;

			pointer end() nothrow;

			bool empty() const nothrow;

			size_type size() const nothrow;

			void clear() nothrow;

			//insert halted for now

			void push_back(ref const Type val);

			void pop_back();

			void push_front(ref const value_type val);

			void pop_front();

			void resize(size_type count);

			void resize(size_type count, ref const value_type val);

			void swap(ref list!Type other) nothrow;

			//void remove(const ref value_type val);

			void merge( ref list!Type other);
		
			void merge(U)(ref list!Type other, U comp);

			void reverse() nothrow;

			void sort();

			void sort(U)(U comp);

			void unique();
			
			void unique(U)(U _Pred);
		private:
			struct node
			{
				node* prev;
				node* next;
			}
			node A;
	}

private:
version(CppRuntime_Microsoft)
{
	/*extern(C++) struct _List_node_remove_op
	{
		this(ref list) nothrow;
		_Nodeptr _Transfer_back(const _Nodeptr _Removed);

		~this();
	}
	*/
	extern(C++) struct equal_to(T = void)
	{

	}

	//might probably be moved to utility 
	extern(C++) struct less(T = void)
	{

	}

}