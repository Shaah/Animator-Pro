	include stdiolib.i

CGROUP	group	code

code	segment dword 'CODE'
	assume cs:CGROUP,ds:CGROUP

STDIOLIB_JUMP fclose siol_fclose

code	ends
	end
