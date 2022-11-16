#!/usr/bin/env ruby
#==========================================================================
# Initial author of this file: Martin.Vahi@softf1.com
# This file is in public domain.
# The following line is a spdx.org license label line:
# SPDX-License-Identifier: 0BSD
#--------------------------------------------------------------------------

require "monitor"

#--------------------------------------------------------------------------
if !defined? $kibuvits_lc_mx_streamaccess
   $kibuvits_lc_mx_streamaccess=Monitor.new
end # if
$kibuvits_lc_emptystring=""

#--------------------------------------------------------------------------

def kibuvits_s_concat_array_of_strings(ar_in)
   s_lc_emptystring=""
   if defined? KIBUVITS_b_DEBUG
      if KIBUVITS_b_DEBUG
         bn=binding()
         kibuvits_typecheck bn, Array, ar_in
      end # if
   end # if
   i_n=ar_in.size
   if i_n<3
      if i_n==2
         s_out=ar_in[0]+ar_in[1]
         return s_out
      else
         if i_n==1
            # For the sake of consistency one
            # wants to make sure that the returned
            # string instance always differs from those
            # that are within the ar_in.
            s_out=s_lc_emptystring+ar_in[0]
            return s_out
         else # i_n==0
            s_out=s_lc_emptystring
            return s_out
         end # if
      end # if
   end # if
   s_out=s_lc_emptystring # needs to be inited to the ""

   # The classic part for testing and playing.
   # ar_in.size.times{|i| s_out=s_out+ar_in[i]}
   # return s_out

   # In its essence the rest of the code here implements
   # a tail-recursive version of this function. The idea is that
   #
   # s_out='something_very_long'.'short_string_1'.short_string_2'
   # uses a temporary string of length
   # 'something_very_long'.'short_string_1'
   # but
   # s_out='something_very_long'.('short_string_1'.short_string_2')
   # uses a much more CPU-cache friendly temporary string of length
   # 'short_string_1'.short_string_2'
   #
   # Believe it or not, but as of January 2012 the speed difference
   # in PHP can be at least about 20% and in Ruby about 50%.
   # Please do not take my word on it. Try it out yourself by
   # modifying this function and assembling strings of length
   # 10000 from single characters.
   #
   # This here is probably not the most optimal solution, because
   # within the more optimal solution the the order of
   # "concatenation glue placements" depends on the lengths
   # of the tokens/strings, but as the analysis and "gluing queue"
   # assembly also has a computational cost, the version
   # here is almost always more optimal than the totally
   # naive version.
   ar_1=ar_in
   b_ar_1_equals_ar_in=true # to avoid modifying the received Array
   ar_2=Array.new
   b_take_from_ar_1=true
   b_not_ready=true
   i_reminder=nil
   i_loop=nil
   i_ar_in_len=nil
   i_ar_out_len=0 # code after the while loop needs a number
   s_1=nil
   s_2=nil
   s_3=nil
   i_2=nil
   while b_not_ready
      # The next if-statement is to avoid copying temporary
      # strings between the ar_1 and the ar_2.
      if b_take_from_ar_1
         i_ar_in_len=ar_1.size
         i_reminder=i_ar_in_len%2
         i_loop=(i_ar_in_len-i_reminder)/2
         i_loop.times do |i|
            i_2=i*2
            s_1=ar_1[i_2]
            s_2=ar_1[i_2+1]
            s_3=s_1+s_2
            ar_2<<s_3
         end # loop
         if i_reminder==1
            s_3=ar_1[i_ar_in_len-1]
            ar_2<<s_3
         end # if
         i_ar_out_len=ar_2.size
         if 1<i_ar_out_len
            if b_ar_1_equals_ar_in
               ar_1=Array.new
               b_ar_1_equals_ar_in=false
            else
               ar_1.clear
            end # if
         else
            b_not_ready=false
         end # if
      else # b_take_from_ar_1==false
         i_ar_in_len=ar_2.size
         i_reminder=i_ar_in_len%2
         i_loop=(i_ar_in_len-i_reminder)/2
         i_loop.times do |i|
            i_2=i*2
            s_1=ar_2[i_2]
            s_2=ar_2[i_2+1]
            s_3=s_1+s_2
            ar_1<<s_3
         end # loop
         if i_reminder==1
            s_3=ar_2[i_ar_in_len-1]
            ar_1<<s_3
         end # if
         i_ar_out_len=ar_1.size
         if 1<i_ar_out_len
            ar_2.clear
         else
            b_not_ready=false
         end # if
      end # if
      b_take_from_ar_1=!b_take_from_ar_1
   end # loop
   if i_ar_out_len==1
      if b_take_from_ar_1
         s_out=ar_1[0]
      else
         s_out=ar_2[0]
      end # if
   else
      # The s_out has been inited to "".
      if 0<i_ar_out_len
         raise Exception.new("This function is flawed.")
      end # if
   end # if
   return s_out
end # kibuvits_s_concat_array_of_strings

#--------------------------------------------------------------------------

def str2file(s_a_string, s_fp)
   $kibuvits_lc_mx_streamaccess.synchronize do
      begin
         file=File.open(s_fp, "w")
         file.write(s_a_string)
         file.close
      rescue Exception =>err
         raise "No comments. GUID='6e91e91c-2c85-450a-b462-4290713015e7' \n"+
         "s_a_string=="+s_a_string+"\n"+err.to_s+"\n\n"
      end #
   end # synchronize
end # str2file


def file2str(s_file_path)
   s_out=$kibuvits_lc_emptystring
   $kibuvits_lc_mx_streamaccess.synchronize do
      s_fp=s_file_path
      ar_lines=Array.new
      begin
         File.open(s_fp) do |file|
            while line = file.gets
               ar_lines<<$kibuvits_lc_emptystring+line
            end # while
         end # Open-file region.
         s_out=kibuvits_s_concat_array_of_strings(ar_lines)
      rescue Exception =>err
         raise(Exception.new("\n"+err.to_s+"\n\ns_file_path=="+
         s_file_path+
         "\n GUID='1802dc55-1d40-435c-9562-4290713015e7'\n\n"))
      end #
   end # synchronize
   return s_out
end # file2str

#--------------------------------------------------------------------------


class Mmmv_utilities_text_processing_lstop_t1

   def initialize
   end # initialize

   private

   def ar_exc_file_records(s_file_in)
      #-rwxr-xr-x  1 ts2 users   1K Jan 23 15:15 ./COMMENTS.txt
      #              -   r   w   x            1           ts2          users
      rgx_prefix=/^[d-]([r-][w-][x-]){3}[\s]+[\d]+[\s]+[\w][\w\d]+[\s]+[\w][\w\d]+[\s]+/
      rgx_ending_linebreak=/[\n]$/
      md=nil
      ar_out=Array.new
      s_prefix=nil
      s_record=nil
      s_0=nil
      i_len_prefix=nil
      i_len_line=nil
      s_file_in.each_line do |s_line_with_linebreak|
         md=s_line_with_linebreak.match(rgx_prefix)
         if md==nil
            raise("\nSize list file format mismatch.\n"+
            "GUID='00534b34-d31e-4510-a562-4290713015e7'\n\n")
         end # if
         s_prefix=md[0]
         i_len_prefix=s_prefix.length
         i_len_line=s_line_with_linebreak.length
         if  i_len_line <= i_len_prefix
            raise("\nSize list file format mismatch or flawed code.\n"+
            "GUID='eed7a44d-d85d-4ff1-9562-4290713015e7'\n\n")
         end # if
         s_0=s_line_with_linebreak[i_len_prefix..(-1)]
         s_0.sub!(rgx_ending_linebreak,$kibuvits_lc_emptystring)
         s_record=s_0
         ar_out<<s_record
      end # loop
      return ar_out
   end # ar_exc_file_records


   #   key == <file ID>
   # value == <file size in bytes>
   def ht_exc_ar_records_2_ht_records(ar_records)
      # "-rwxr-xr-x  1 ts2 users   1K Jan 23 15:15 ./COMMENTS.txt" -->
      # --> "1K Jan 23 15:15 ./COMMENTS.txt" -->
      # --> ["1024"]["Jan 23 15:15 ./COMMENTS.txt"]
      #--------------------------------------------------
      rgx_0=/[\s]+$/
      rgx_1=/[^\d]/
      i_lc_1024_2=1024**2
      i_lc_1024_3=1024**3
      i_lc_1024_4=1024**4
      func_i_file_size_len=lambda do |s_file_size| # input example: "1K "
         s_0=s_file_size.sub(rgx_0,$kibuvits_lc_emptystring) # "1K " -> "1K"
         if s_0.length<2
            raise("\nSize list file format mismatch.\n"+
            s_file_size+"\n"+
            "GUID='631d5222-7e69-4a9b-9362-4290713015e7'\n\n")
         end # if
         s_1=s_0[(-1)..(-1)] # "1K" -> "K"
         s_2=s_0[0..(-2)]    # "1K" -> "1"
         if s_2.match(rgx_1)!=nil
            raise("\nSize list file format mismatch.\n"+
            s_file_size+"\n"+
            "GUID='d5e368ae-419a-41a4-ae62-4290713015e7'\n\n")
         end # if
         #--------
         i_file_size=s_2.to_i
         case s_1
         when "K"
            i_file_size=i_file_size*1024
         when "M"
            i_file_size=i_file_size*i_lc_1024_2
         when "G"
            i_file_size=i_file_size*i_lc_1024_3
         when "T"
            i_file_size=i_file_size*i_lc_1024_4
         else
            raise("\nSize list file format mismatch.\n"+
            s_file_size+"\n"+
            "GUID='1f94eb75-5126-487d-9362-4290713015e7'\n\n")
         end # case s_0
         return i_file_size
      end # func_i_file_size_len
      #--------------------------------------------------
      ht_out=Hash.new
      rgx_2=/^[\d]+[KMGT][\s]+/ # "1K Jan 23 15:15 ./COMMENTS.txt" -->
      rgx_3=/[\s]+/
      s_file_size=nil
      i_s_file_size_len=nil
      s_file_id=nil
      i_file_size_in_bytes=0
      md=nil
      ar_records.each do |s_record|
         md=s_record.match(rgx_2)
         if md==nil
            raise("\nSize list file format mismatch.\n"+
            "GUID='60db1123-a1e2-4ae3-9162-4290713015e7'\n\n")
         end # if
         s_file_size=md[0]
         i_s_file_size_len=s_file_size.length
         if s_record.length <= i_s_file_size_len
            raise("\nSize list file format mismatch.\n"+
            s_record+"\n"+
            "GUID='b2882732-b7a4-4554-b562-4290713015e7'\n\n")
         end # if
         s_file_id=s_record[i_s_file_size_len..(-1)]
         if s_file_id.sub(rgx_3,$kibuvits_lc_emptystring).length == 0
            raise("\nSize list file format mismatch.\n"+
            s_record+"\n"+
            "GUID='5d706435-87cb-4c9d-b262-4290713015e7'\n\n")
         end # if
         i_file_size_in_bytes=func_i_file_size_len.call(s_file_size)
         ht_out[s_file_id]=i_file_size_in_bytes
      end # loop
      return ht_out
   end # ht_exc_ar_records_2_ht_records


   def ht_biggest_files(ht_records,n)
      if n < 1
         raise("\nFlawed method call.\n"+
         "GUID='54df9711-8355-4a0a-bf62-4290713015e7'\n\n")
      end # if
      ht_out=Hash.new
      i_ht_records_len=ht_records.size
      if i_ht_records_len<=n
         ht_records.each_pair do |s_key,i_value|
            ht_out[s_key]=i_value
         end # loop
         return ht_out
      end # if
      #--------
      ar_values_uniq=ht_records.values.uniq.sort.reverse # biggest at index 0
      i_ar_values_uniq_len=ar_values_uniq.size
      n_1=n # guaranteed to hold: n <= ht_records.size
      n_1=i_ar_values_uniq_len if i_ar_values_uniq_len<n
      ar_top=ar_values_uniq.take(n_1) # guaranteed to hold: 1 <= n_1
      #--------
      # Multiple files can have the same size,
      # including the biggest files.
      ix_ar_top=0 # biggest
      ar_keys=ht_records.keys
      i_file_size_in_bytes=nil
      i_file_size_in_bytes_searchvalue=nil
      i_n_of_records_collected=0
      while i_n_of_records_collected<n #guaranteed to hold: n <= ht_records.size
         i_file_size_in_bytes_searchvalue=ar_top[ix_ar_top]
         if i_file_size_in_bytes_searchvalue==nil
            raise("\nThere's a flaw in the code of this method.\n"+
            "GUID='ae454910-aa6c-4b96-9462-4290713015e7'\n\n")
         end # if
         ar_keys.each do |s_file_id|
            i_file_size_in_bytes=ht_records[s_file_id]
            if i_file_size_in_bytes == i_file_size_in_bytes_searchvalue
               ht_out[s_file_id]=i_file_size_in_bytes
               i_n_of_records_collected=i_n_of_records_collected+1
            end # if
            break if n<=i_n_of_records_collected
         end # loop
         ix_ar_top=ix_ar_top+1
      end # loop
      #--------
      return ht_out
   end # ht_biggest_files

   def s_ht_top_list(ht_biggest_files)
      #--------
      ar=ht_biggest_files.values.uniq.sort.reverse # biggest at index 0
      s_size_len_max=ar[0].to_s.length
      #--------
      s_lc_0=" "
      s_lc_1="\n\n"
      s_lc_2="size_in_bytes: "
      s_lc_3="  file_id: "
      ar_s=Array.new
      #--------
      s_0=nil
      s_1=nil
      ht_biggest_files.each_pair do |s_file_id,i_file_size_in_bytes|
         s_0=i_file_size_in_bytes.to_s
         s_1=s_lc_0*(s_size_len_max-s_0.length)+s_0
         ar_s<<((s_lc_2+s_1)+(s_lc_3+s_file_id+s_lc_1))
      end # loop
      #--------
      ar_s.sort # file size part of the string determins alphabetical order
      s_out=kibuvits_s_concat_array_of_strings(ar_s)
      return s_out
   end # s_ht_top_list

   public

   def s_exc_list_of_biggest_files(s_fp,i_n_top=4)
      if !File.exists? s_fp
         raise("\nThe file with the path of \n\n"+s_fp+
         "\n\nis missing.\n"+
         "GUID='fc39c116-c725-4862-8252-4290713015e7'\n\n")
      end # if
      s_file_in=file2str(s_fp)
      ar_records=ar_exc_file_records(s_file_in)
      ht_records=ht_exc_ar_records_2_ht_records(ar_records)
      ht_biggest_files=ht_biggest_files(ht_records,i_n_top)
      s_top_list="\n"+s_ht_top_list(ht_biggest_files)+"\n"
      return s_top_list
   end # s_exc_list_of_biggest_files

end # Mmmv_utilities_text_processing_lstop_t1

#--------------------------------------------------------------------------
def s_create_doc()
   s_out="\n\n"
   s_out<<"----------------------------------------------------\n"
   s_out<<"CONSOLE_ARGUMENTS :==  < i top list length>  FILE_PATH\n"
   s_out<<"        FILE_PATH :==  < path to a file that is created by (LINUX_LS|BSD_LS) >\n"
   s_out<<"----------------------------------------------------\n"
   s_out<<"         LINUX_LS :==  < command aliases:\n"
   s_out<<"\n"
   s_out<<"    alias mmmv_ls_K_recursive=\"nice -n17 find . -name '*' -print0 | \\\n"
   s_out<<"        xargs -0 ls -l --block-size=K -d | grep -E ^[-] \"\n"
   s_out<<"    alias mmmv_ls_M_recursive=\"nice -n17 find . -name '*' -print0 | \\\n"
   s_out<<"        xargs -0 ls -l --block-size=M -d | grep -E ^[-] \"\n"
   s_out<<"    alias mmmv_ls_G_recursive=\"nice -n17 find . -name '*' -print0 | \\\n"
   s_out<<"        xargs -0 ls -l --block-size=G -d | grep -E ^[-] \"\n"
   s_out<<">\n"
   # Linux non-recursive versions:
   #    alias mmmv_ls_K="nice -n2 ls -l --block-size=K "
   #    alias mmmv_ls_M="nice -n2 ls -l --block-size=M "
   #    alias mmmv_ls_G="nice -n2 ls -l --block-size=G "
   #
   # Might also be useful on Linux:
   #    alias mmmv_lssize_recursive_t1_Linux="nice -n5 du --human-readable --summarize ./ "
   s_out<<"----------------------------------------------------\n"
   s_out<<"           BSD_LS :==  < command alias:\n"
   s_out<<"\n"
   s_out<<"    alias mmmv_lssize_recursive_t1_BSD=\"nice -n5 du -sh ./ \"\n"
   s_out<<">\n"
   # A nonrecursive BSD version:
   # alias mmmv_ls_BKMG="nice -n2 ls -lh "
   s_out<<"----------------------------------------------------\n"
   s_out<<"\n\n"
   return s_out
end # s_create_doc
#--------------------------------------------------------------------------
x_i_n_top_candidate=ARGV[0]
if x_i_n_top_candidate==nil
   raise(s_create_doc()+
   "GUID='cbfa5c14-5910-4675-9552-4290713015e7'\n\n")
end # if
#----
x_i_n_top_candidate=x_i_n_top_candidate.to_i
if x_i_n_top_candidate < 1
   raise("\n\nThe list length(=="+x_i_n_top_candidate.to_s+
   ") must be at least 1 ."+s_create_doc()+
   "GUID='2c516fd2-a4f6-4c4a-8a52-4290713015e7'\n\n")
end # if
i_n_top=x_i_n_top_candidate
#--------
x_s_fp_candidate=ARGV[1]
if x_s_fp_candidate==nil
   raise(s_create_doc()+
   "GUID='c5366412-8e99-4293-9352-4290713015e7'\n\n")
end # if
#----
s_fp_candidate=x_s_fp_candidate.to_s
x_3_arg=ARGV[2]
s_fp=nil
if x_3_arg==nil
   if !File.exist? s_fp_candidate
      raise("\nThe \n\n"+s_fp_candidate+
      "\n\nis required to be a file, but it does not exist."+
      s_create_doc()+
      "GUID='52e2ed5e-d200-48d5-a552-4290713015e7'\n\n")
   end # if
   if !File.file? s_fp_candidate
      raise("\nThe \n\n"+s_fp_candidate+
      "\n\nexists, but it is not a file."+
      s_create_doc()+
      "GUID='6b78d144-81f4-4d7b-b552-4290713015e7'\n\n")
   end # if
   s_fp=s_fp_candidate
else # x_3_arg!=nil
   if x_3_arg.to_s.downcase!="demo"
      raise("\n\nThe only allowed value "+
      "for the 3. console argument is \"demo\" ."+s_create_doc()+
      "GUID='123d97ba-1b6c-4510-a152-4290713015e7'\n\n")
   else
      require "pathname"
      s_0=Pathname.new(__FILE__).realpath.parent.to_s
      s_fp=s_0+"/demo_data.txt"
   end # if
end # if
#--------
ob_engine=Mmmv_utilities_text_processing_lstop_t1.new
s_top=ob_engine.s_exc_list_of_biggest_files(s_fp,i_n_top)
puts s_top

#==========================================================================
