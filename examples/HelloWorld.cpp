#include <neodev/devpack.hpp>

class NeoContract
{
public:
   ENTRYPOINT
   static void main(String op, Array& params)
   {
      //Object::use(op);
      //params.nop();

      StorageContext ctx = Storage::CurrentContext();

      Storage::Put(ctx, Str("Hello"), Str("World"));
   }
};

// declare entrypoint NeoContract::main as real main function
DECLARE_MAIN(NeoContract::main(String::Init(), Array::Init()))
