/* C extension for __rubex__common_utils_.
This file in generated by Rubex::Compiler. Do not change!
File generation time: 2018-05-22 19:18:16 +0200.*/

/*Code file for __rubex__common_utils_*/

#include "__rubex__common_utils_.h"

VALUE __rubex_char2rubystr(char ch)
{
  char s[2];
  s[0] = ch;
  s[1] = '\0';
  return rb_str_new2(s);
}

