/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/152/Documents/CSM152A-Project4/Lab4/sevenSegmentDisplayController.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {192U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {249U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {164U, 0U};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {176U, 0U};
static unsigned int ng9[] = {4U, 0U};
static unsigned int ng10[] = {153U, 0U};
static unsigned int ng11[] = {5U, 0U};
static unsigned int ng12[] = {146U, 0U};
static unsigned int ng13[] = {6U, 0U};
static unsigned int ng14[] = {130U, 0U};
static unsigned int ng15[] = {7U, 0U};
static unsigned int ng16[] = {248U, 0U};
static unsigned int ng17[] = {8U, 0U};
static unsigned int ng18[] = {128U, 0U};
static unsigned int ng19[] = {9U, 0U};
static unsigned int ng20[] = {144U, 0U};
static unsigned int ng21[] = {255U, 0U};
static int ng22[] = {1, 0};
static unsigned int ng23[] = {15U, 0U};
static unsigned int ng24[] = {11U, 0U};
static unsigned int ng25[] = {13U, 0U};
static unsigned int ng26[] = {14U, 0U};



static int sp_getSegment(char *t1, char *t2)
{
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;

LAB0:    t0 = 1;
    xsi_set_current_line(43, ng0);

LAB2:    xsi_set_current_line(44, ng0);
    t3 = (t1 + 3768);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);

LAB3:    t6 = ((char*)((ng1)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t6, 4);
    if (t7 == 1)
        goto LAB4;

LAB5:    t3 = ((char*)((ng3)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB6;

LAB7:    t3 = ((char*)((ng5)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB8;

LAB9:    t3 = ((char*)((ng7)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB10;

LAB11:    t3 = ((char*)((ng9)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB12;

LAB13:    t3 = ((char*)((ng11)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB14;

LAB15:    t3 = ((char*)((ng13)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB16;

LAB17:    t3 = ((char*)((ng15)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB18;

LAB19:    t3 = ((char*)((ng17)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB20;

LAB21:    t3 = ((char*)((ng19)));
    t7 = xsi_vlog_unsigned_case_compare(t5, 4, t3, 4);
    if (t7 == 1)
        goto LAB22;

LAB23:
LAB25:
LAB24:    xsi_set_current_line(55, ng0);
    t3 = ((char*)((ng21)));
    t4 = (t1 + 3608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);

LAB26:    t0 = 0;

LAB1:    return t0;
LAB4:    xsi_set_current_line(45, ng0);
    t8 = ((char*)((ng2)));
    t9 = (t1 + 3608);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 8);
    goto LAB26;

LAB6:    xsi_set_current_line(46, ng0);
    t4 = ((char*)((ng4)));
    t6 = (t1 + 3608);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 8);
    goto LAB26;

LAB8:    xsi_set_current_line(47, ng0);
    t4 = ((char*)((ng6)));
    t6 = (t1 + 3608);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 8);
    goto LAB26;

LAB10:    xsi_set_current_line(48, ng0);
    t4 = ((char*)((ng8)));
    t6 = (t1 + 3608);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 8);
    goto LAB26;

LAB12:    xsi_set_current_line(49, ng0);
    t4 = ((char*)((ng10)));
    t6 = (t1 + 3608);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 8);
    goto LAB26;

LAB14:    xsi_set_current_line(50, ng0);
    t4 = ((char*)((ng12)));
    t6 = (t1 + 3608);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 8);
    goto LAB26;

LAB16:    xsi_set_current_line(51, ng0);
    t4 = ((char*)((ng14)));
    t6 = (t1 + 3608);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 8);
    goto LAB26;

LAB18:    xsi_set_current_line(52, ng0);
    t4 = ((char*)((ng16)));
    t6 = (t1 + 3608);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 8);
    goto LAB26;

LAB20:    xsi_set_current_line(53, ng0);
    t4 = ((char*)((ng18)));
    t6 = (t1 + 3608);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 8);
    goto LAB26;

LAB22:    xsi_set_current_line(54, ng0);
    t4 = ((char*)((ng20)));
    t6 = (t1 + 3608);
    xsi_vlogvar_assign_value(t6, t4, 0, 0, 8);
    goto LAB26;

}

static void Always_60_0(char *t0)
{
    char t13[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t14;

LAB0:    t1 = (t0 + 4688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 5256);
    *((int *)t2) = 1;
    t3 = (t0 + 4720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(60, ng0);

LAB5:    xsi_set_current_line(61, ng0);
    t4 = (t0 + 3448);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 2);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(63, ng0);
    t9 = (t0 + 3448);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng22)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t11, 2, t12, 32);
    t14 = (t0 + 3448);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 2, 0LL);
    goto LAB15;

LAB9:    xsi_set_current_line(65, ng0);
    t3 = (t0 + 3448);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng22)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t5, 2, t7, 32);
    t9 = (t0 + 3448);
    xsi_vlogvar_wait_assign_value(t9, t13, 0, 0, 2, 0LL);
    goto LAB15;

LAB11:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 3448);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng22)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t5, 2, t7, 32);
    t9 = (t0 + 3448);
    xsi_vlogvar_wait_assign_value(t9, t13, 0, 0, 2, 0LL);
    goto LAB15;

LAB13:    xsi_set_current_line(69, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 3448);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 2, 0LL);
    goto LAB15;

}

static void Always_73_1(char *t0)
{
    char t20[8];
    char t25[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    t1 = (t0 + 4936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 5272);
    *((int *)t2) = 1;
    t3 = (t0 + 4968);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(73, ng0);

LAB5:    xsi_set_current_line(74, ng0);
    t4 = (t0 + 3448);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 2);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(75, ng0);

LAB16:    xsi_set_current_line(76, ng0);
    t9 = ((char*)((ng15)));
    t10 = (t0 + 3288);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 4);
    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng23)));
    t3 = (t0 + 4744);
    t4 = (t0 + 1936);
    t5 = xsi_create_subprogram_invocation(t3, 0, t0, t4, 0, 0);
    t7 = (t0 + 3768);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 4);

LAB17:    t9 = (t0 + 4840);
    t10 = *((char **)t9);
    t11 = (t10 + 80U);
    t12 = *((char **)t11);
    t13 = (t12 + 272U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t8 = ((int  (*)(char *, char *))t16)(t0, t10);
    if (t8 != 0)
        goto LAB19;

LAB18:    t10 = (t0 + 4840);
    t17 = *((char **)t10);
    t10 = (t0 + 3608);
    t18 = (t10 + 56U);
    t19 = *((char **)t18);
    memcpy(t20, t19, 8);
    t21 = (t0 + 1936);
    t22 = (t0 + 4744);
    t23 = 0;
    xsi_delete_subprogram_invocation(t21, t17, t0, t22, t23);
    t24 = (t0 + 3128);
    xsi_vlogvar_assign_value(t24, t20, 0, 0, 8);
    goto LAB15;

LAB9:    xsi_set_current_line(79, ng0);

LAB20:    xsi_set_current_line(80, ng0);
    t3 = ((char*)((ng24)));
    t4 = (t0 + 3288);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng23)));
    t3 = (t0 + 4744);
    t4 = (t0 + 1936);
    t5 = xsi_create_subprogram_invocation(t3, 0, t0, t4, 0, 0);
    t7 = (t0 + 3768);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 4);

LAB21:    t9 = (t0 + 4840);
    t10 = *((char **)t9);
    t11 = (t10 + 80U);
    t12 = *((char **)t11);
    t13 = (t12 + 272U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t8 = ((int  (*)(char *, char *))t16)(t0, t10);
    if (t8 != 0)
        goto LAB23;

LAB22:    t10 = (t0 + 4840);
    t17 = *((char **)t10);
    t10 = (t0 + 3608);
    t18 = (t10 + 56U);
    t19 = *((char **)t18);
    memcpy(t20, t19, 8);
    t21 = (t0 + 1936);
    t22 = (t0 + 4744);
    t23 = 0;
    xsi_delete_subprogram_invocation(t21, t17, t0, t22, t23);
    t24 = (t0 + 3128);
    xsi_vlogvar_assign_value(t24, t20, 0, 0, 8);
    goto LAB15;

LAB11:    xsi_set_current_line(83, ng0);

LAB24:    xsi_set_current_line(84, ng0);
    t3 = ((char*)((ng25)));
    t4 = (t0 + 3288);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng23)));
    t3 = (t0 + 4744);
    t4 = (t0 + 1936);
    t5 = xsi_create_subprogram_invocation(t3, 0, t0, t4, 0, 0);
    t7 = (t0 + 3768);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 4);

LAB25:    t9 = (t0 + 4840);
    t10 = *((char **)t9);
    t11 = (t10 + 80U);
    t12 = *((char **)t11);
    t13 = (t12 + 272U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t8 = ((int  (*)(char *, char *))t16)(t0, t10);
    if (t8 != 0)
        goto LAB27;

LAB26:    t10 = (t0 + 4840);
    t17 = *((char **)t10);
    t10 = (t0 + 3608);
    t18 = (t10 + 56U);
    t19 = *((char **)t18);
    memcpy(t20, t19, 8);
    t21 = (t0 + 1936);
    t22 = (t0 + 4744);
    t23 = 0;
    xsi_delete_subprogram_invocation(t21, t17, t0, t22, t23);
    t24 = (t0 + 3128);
    xsi_vlogvar_assign_value(t24, t20, 0, 0, 8);
    goto LAB15;

LAB13:    xsi_set_current_line(87, ng0);

LAB28:    xsi_set_current_line(88, ng0);
    t3 = ((char*)((ng26)));
    t4 = (t0 + 3288);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 2568U);
    t3 = *((char **)t2);
    memcpy(t20, t3, 8);
    t2 = (t0 + 4744);
    t4 = (t0 + 1936);
    t5 = xsi_create_subprogram_invocation(t2, 0, t0, t4, 0, 0);
    t7 = (t0 + 3768);
    xsi_vlogvar_assign_value(t7, t20, 0, 0, 4);

LAB29:    t9 = (t0 + 4840);
    t10 = *((char **)t9);
    t11 = (t10 + 80U);
    t12 = *((char **)t11);
    t13 = (t12 + 272U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t8 = ((int  (*)(char *, char *))t16)(t0, t10);
    if (t8 != 0)
        goto LAB31;

LAB30:    t10 = (t0 + 4840);
    t17 = *((char **)t10);
    t10 = (t0 + 3608);
    t18 = (t10 + 56U);
    t19 = *((char **)t18);
    memcpy(t25, t19, 8);
    t21 = (t0 + 1936);
    t22 = (t0 + 4744);
    t23 = 0;
    xsi_delete_subprogram_invocation(t21, t17, t0, t22, t23);
    t24 = (t0 + 3128);
    xsi_vlogvar_assign_value(t24, t25, 0, 0, 8);
    goto LAB15;

LAB19:    t9 = (t0 + 4936U);
    *((char **)t9) = &&LAB17;
    goto LAB1;

LAB23:    t9 = (t0 + 4936U);
    *((char **)t9) = &&LAB21;
    goto LAB1;

LAB27:    t9 = (t0 + 4936U);
    *((char **)t9) = &&LAB25;
    goto LAB1;

LAB31:    t9 = (t0 + 4936U);
    *((char **)t9) = &&LAB29;
    goto LAB1;

}


extern void work_m_00000000001534929223_3360950273_init()
{
	static char *pe[] = {(void *)Always_60_0,(void *)Always_73_1};
	static char *se[] = {(void *)sp_getSegment};
	xsi_register_didat("work_m_00000000001534929223_3360950273", "isim/bossBattleTop_tb_isim_beh.exe.sim/work/m_00000000001534929223_3360950273.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
