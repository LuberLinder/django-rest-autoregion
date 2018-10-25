--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-1.pgdg90+1)
-- Dumped by pg_dump version 10.5 (Debian 10.5-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_code (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    name text NOT NULL,
    orig_name text NOT NULL,
    cities text[] NOT NULL,
    country_id integer NOT NULL,
    lang_id integer NOT NULL
);


ALTER TABLE public.api_code OWNER TO postgres;

--
-- Name: api_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_code_id_seq OWNER TO postgres;

--
-- Name: api_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_code_id_seq OWNED BY public.api_code.id;


--
-- Name: api_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_country (
    id integer NOT NULL,
    name text NOT NULL,
    lang_id integer NOT NULL,
    parent_id integer
);


ALTER TABLE public.api_country OWNER TO postgres;

--
-- Name: api_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_country_id_seq OWNER TO postgres;

--
-- Name: api_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_country_id_seq OWNED BY public.api_country.id;


--
-- Name: api_lang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_lang (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.api_lang OWNER TO postgres;

--
-- Name: api_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_lang_id_seq OWNER TO postgres;

--
-- Name: api_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_lang_id_seq OWNED BY public.api_lang.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: api_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_code ALTER COLUMN id SET DEFAULT nextval('public.api_code_id_seq'::regclass);


--
-- Name: api_country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_country ALTER COLUMN id SET DEFAULT nextval('public.api_country_id_seq'::regclass);


--
-- Name: api_lang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_lang ALTER COLUMN id SET DEFAULT nextval('public.api_lang_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: api_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_code (id, code, name, orig_name, cities, country_id, lang_id) FROM stdin;
80	АЛ	Алексинац		{Алексинац}	1	1
81	АР	Аранђеловац		{Аранђеловац}	1	1
82	АЦ	Александровац		{Александровац}	1	1
83	ББ	Бајина Башта		{"Бајина Башта"}	1	1
84	БГ	Београд		{Барајево,Вождовац,Врачар,Гроцка,Звездара,Земун,Лазаревац,Младеновац,"Нови Београд",Обреновац,Палилула,Раковица,"Савски Венац",Сопот,"Стари Град",Сурчин,Чукарица}	1	1
85	БО	Бор		{Мајданпек,Бор}	1	1
86	БП	Бачка Паланка		{"Бачка Паланка"}	1	1
87	БТ	Бачка Топола		{"Бачка Топола"}	1	1
88	БЋ	Богатић		{Богатић}	1	1
89	БУ	Бујановац		{Бујановац}	1	1
90	БЧ	Бечеј		{Бечеј}	1	1
91	ВА	Ваљево		{Лајковац,Љиг,Мионица,Осечина,Ваљево}	1	1
92	ВБ	Врњачка Бања		{"Врњачка Бања"}	1	1
93	ВЛ	Власотинце		{Власотинце}	1	1
94	ВП	Велика Плана		{"Велика Плана"}	1	1
95	ВР	Врање		{Босилеград,"Владичин Хан",Прешево,Трговиште,Врање}	1	1
96	ВС	Врбас		{Врбас}	1	1
97	ВШ	Вршац		{"Бела Црква",Пландиште,Вршац}	1	1
98	ГЛ	Гњилане		{Витина,"Косовска Каменица","Ново Брдо",Гњилане}	1	1
99	ГМ	Горњи Милановац		{"Горњи Милановац"}	1	1
100	ДЕ	Деспотовац		{Деспотовац}	1	1
101	ЂА	Ђаковица		{Дечани,Ђаковица}	1	1
102	ЗА	Зајечар		{Бољевац,Сокобања,Зајечар}	1	1
103	ЗР	Зрењанин		{Житиште,"Нови Бечеј","Нова Црња",Сечањ,Зрењанин}	1	1
104	ИН	Инђија		{Инђија}	1	1
105	ИЦ	Ивањица		{Ивањица}	1	1
106	ЈА	Јагодина		{Рековац,Јагодина}	1	1
107	КА	Кањижа		{Кањижа}	1	1
108	КВ	Краљево		{Краљево}	1	1
109	КГ	Крагујевац		{Баточина,Кнић,Лапово,Рача,Крагујевац}	1	1
110	КЖ	Књажевац		{Књажевац}	1	1
111	КИ	Кикинда		{Чока,"Нови Кнежевац",Кикинда}	1	1
112	КЛ	Кладово		{Кладово}	1	1
113	КМ	Косовска Митровица		{Вучитрн,Звечан,"Зубин Поток",Лепосавић,Србица,"Косовска Митровица"}	1	1
114	КО	Ковин		{Ковин}	1	1
115	КШ	Крушевац		{Брус,Варварин,Ћићевац,Крушевац}	1	1
116	ЛБ	Лебане		{Лебане}	1	1
117	ЛЕ	Лесковац		{Бојник,Медвеђа,"Црна Трава",Лесковац}	1	1
118	ЛО	Лозница		{Крупањ,Љубовија,"Мали Зворник",Лозница}	1	1
119	ЛУ	Лучани		{Лучани}	1	1
120	НВ	Нова Варош		{"Нова Варош"}	1	1
121	НГ	Неготин		{Неготин}	1	1
122	НИ	Ниш		{Дољевац,"Гаџин Хан",Мерошина,Ражањ,Сврљиг,Ниш}	1	1
123	НП	Нови Пазар		{"Нови Пазар"}	1	1
124	НС	Нови Сад		{Бач,"Бачки Петровац",Беочин,Жабаљ,Петроварадин,Србобран,"Сремски Карловци",Темерин,Тител,"Нови Сад"}	1	1
125	ПА	Панчево		{Алибунар,Ковачица,Опово,Панчево}	1	1
126	ПБ	Прибој		{Прибој}	1	1
127	ПЕ	Пећ		{Исток,Клина,Пећ}	1	1
128	ПЖ	Пожега		{Пожега}	1	1
129	ПЗ	Призрен		{Гора,Ораховац,"Сува Река",Призрен}	1	1
130	ПИ	Пирот		{Бабушница,"Бела Паланка",Димитровград,Пирот}	1	1
131	ПК	Прокупље		{Блаце,Житорађа,Куршумлија,Прокупље}	1	1
132	ПН	Параћин		{Параћин}	1	1
133	ПО	Пожаревац		{"Велико Градиште",Голубац,Жабари,Жагубица,Кучево,"Мало Црниће",Пожаревац}	1	1
134	ПП	Пријепоље		{Пријепоље}	1	1
135	ПР	Приштина		{Глоговац,"Косово Поље",Липљан,Обилић,Подујево,Приштина}	1	1
136	ПТ	Петровац		{Петровац}	1	1
137	РА	Рашка		{Рашка}	1	1
138	РУ	Рума		{Ириг,Пећинци,Рума}	1	1
139	СА	Сента		{Ада,Сента}	1	1
140	СВ	Свилајнац		{Свилајнац}	1	1
141	СД	Смедерево		{Смедерево}	1	1
142	СЈ	Сјеница		{Сјеница}	1	1
143	СМ	Сремска Митровица		{"Сремска Митровица"}	1	1
144	СО	Сомбор		{Апатин,Кула,Оџаци,Сомбор}	1	1
145	СП	Смедеревска Паланка		{"Смедеревска Паланка"}	1	1
146	СТ	Стара Пазова		{"Стара Пазова"}	1	1
147	СУ	Суботица		{"Мали Иђош",Суботица}	1	1
148	СЦ	Сурдулица		{Сурдулица}	1	1
149	ТО	Топола		{Топола}	1	1
150	ТС	Трстеник		{Трстеник}	1	1
151	ТТ	Тутин		{Тутин}	1	1
152	ЋУ	Ћуприја		{Ћуприја}	1	1
153	УБ	Уб		{Уб}	1	1
154	УЕ	Ужице		{Ариље,Косјерић,Чајетина,Ужице}	1	1
155	УР	Урошевац		{Качаник,Урошевац,Штимље,Штрпце}	1	1
156	ЧА	Чачак		{Чачак}	1	1
157	ША	Шабац		{Владимирци,Коцељева,Шабац}	1	1
158	ШИ	Шид		{Шид}	1	1
159	AL	Aleksinac		{Aleksinac}	1	2
160	AR	Aranđelovac		{Aranđelovac}	1	2
161	AC	Aleksandrovac		{Aleksandrovac}	1	2
162	BB	Bajina Bašta		{"Bajina Bašta"}	1	2
163	BG	Beograd		{Barajevo,Voždovac,Vračar,Grocka,Zvezdara,Zemun,Lazarevac,Mladenovac,"Novi Beograd",Obrenovac,Palilula,Rakovica,"Savski Venac",Sopot,"Stari Grad",Surčin,Čukarica}	1	2
164	BO	Bor		{Majdanpek,Bor}	1	2
165	BP	Bačka Palanka		{"Bačka Palanka"}	1	2
166	BT	Bačka Topola		{"Bačka Topola"}	1	2
167	BĆ	Bogatić		{Bogatić}	1	2
168	BU	Bujanovac		{Bujanovac}	1	2
169	BČ	Bečej		{Bečej}	1	2
170	VA	Valjevo		{Lajkovac,Ljig,Mionica,Osečina,Valjevo}	1	2
171	VB	Vrnjačka Banja		{"Vrnjačka Banja"}	1	2
172	VL	Vlasotince		{Vlasotince}	1	2
173	VP	Velika Plana		{"Velika Plana"}	1	2
174	VR	Vranje		{Bosilegrad,"Vladičin Han",Preševo,Trgovište,Vranje}	1	2
175	VS	Vrbas		{Vrbas}	1	2
176	VŠ	Vršac		{"Bela Crkva",Plandište,Vršac}	1	2
177	GL	Gnjilane		{Vitina,"Kosovska Kamenica","Novo Brdo",Gnjilane}	1	2
178	GM	Gornji Milanovac		{"Gornji Milanovac"}	1	2
179	DE	Despotovac		{Despotovac}	1	2
180	ĐA	Đakovica		{Dečani,Đakovica}	1	2
181	ZA	Zaječar		{Boljevac,Sokobanja,Zaječar}	1	2
182	ZR	Zrenjanin		{Žitište,"Novi Bečej","Nova Crnja",Sečanj,Zrenjanin}	1	2
183	IN	Inđija		{Inđija}	1	2
184	IC	Ivanjica		{Ivanjica}	1	2
185	JA	Jagodina		{Rekovac,Jagodina}	1	2
186	KA	Kanjiža		{Kanjiža}	1	2
187	KV	Kraljevo		{Kraljevo}	1	2
188	KG	Kragujevac		{Batočina,Knić,Lapovo,Rača,Kragujevac}	1	2
189	KŽ	Knjaževac		{Knjaževac}	1	2
190	KI	Kikinda		{Čoka,"Novi Kneževac",Kikinda}	1	2
191	KL	Kladovo		{Kladovo}	1	2
192	KM	Kosovska Mitrovica		{Vučitrn,Zvečan,"Zubin Potok",Leposavić,Srbica,"Kosovska Mitrovica"}	1	2
193	KO	Kovin		{Kovin}	1	2
194	KŠ	Kruševac		{Brus,Varvarin,Ćićevac,Kruševac}	1	2
195	LB	Lebane		{Lebane}	1	2
196	LE	Leskovac		{Bojnik,Medveđa,"Crna Trava",Leskovac}	1	2
197	LO	Loznica		{Krupanj,Ljubovija,"Mali Zvornik",Loznica}	1	2
198	LU	Lučani		{Lučani}	1	2
199	NV	Nova Varoš		{"Nova Varoš"}	1	2
200	NG	Negotin		{Negotin}	1	2
201	NI	Niš		{Doljevac,"Gadžin Han",Merošina,Ražanj,Svrljig,Niš}	1	2
202	NP	Novi Pazar		{"Novi Pazar"}	1	2
203	NS	Novi Sad		{Bač,"Bački Petrovac",Beočin,Žabalj,Petrovaradin,Srbobran,"Sremski Karlovci",Temerin,Titel,"Novi Sad"}	1	2
204	PA	Pančevo		{Alibunar,Kovačica,Opovo,Pančevo}	1	2
205	PB	Priboj		{Priboj}	1	2
206	PE	Peć		{Istok,Klina,Peć}	1	2
207	PŽ	Požega		{Požega}	1	2
208	PZ	Prizren		{Gora,Orahovac,"Suva Reka",Prizren}	1	2
209	PI	Pirot		{Babušnica,"Bela Palanka",Dimitrovgrad,Pirot}	1	2
210	PK	Prokuplje		{Blace,Žitorađa,Kuršumlija,Prokuplje}	1	2
211	PN	Paraćin		{Paraćin}	1	2
212	PO	Požarevac		{"Veliko Gradište",Golubac,Žabari,Žagubica,Kučevo,"Malo Crniće",Požarevac}	1	2
213	PP	Prijepolje		{Prijepolje}	1	2
214	PR	Priština		{Glogovac,"Kosovo Polje",Lipljan,Obilić,Podujevo,Priština}	1	2
215	PT	Petrovac		{Petrovac}	1	2
216	RA	Raška		{Raška}	1	2
217	RU	Ruma		{Irig,Pećinci,Ruma}	1	2
218	SA	Senta		{Ada,Senta}	1	2
219	SV	Svilajnac		{Svilajnac}	1	2
220	SD	Smederevo		{Smederevo}	1	2
221	SJ	Sjenica		{Sjenica}	1	2
222	SM	Sremska Mitrovica		{"Sremska Mitrovica"}	1	2
223	SO	Sombor		{Apatin,Kula,Odžaci,Sombor}	1	2
224	SP	Smederevska Palanka		{"Smederevska Palanka"}	1	2
225	ST	Stara Pazova		{"Stara Pazova"}	1	2
226	SU	Subotica		{"Mali Iđoš",Subotica}	1	2
227	SC	Surdulica		{Surdulica}	1	2
228	TO	Topola		{Topola}	1	2
229	TS	Trstenik		{Trstenik}	1	2
230	TT	Tutin		{Tutin}	1	2
231	ĆU	Ćuprija		{Ćuprija}	1	2
232	UB	Ub		{Ub}	1	2
233	UE	Užice		{Arilje,Kosjerić,Čajetina,Užice}	1	2
234	UR	Uroševac		{Kačanik,Uroševac,Štimlje,Štrpce}	1	2
235	ČA	Čačak		{Čačak}	1	2
236	ŠA	Šabac		{Vladimirci,Koceljeva,Šabac}	1	2
237	ŠI	Šid		{Šid}	1	2
238	АЛ	Алексинац	Алексинац	{Алексинац}	1	3
239	АР	Аранджеловац	Аранђеловац	{Аранджеловац}	1	3
240	АЦ	Александровац	Александровац	{Александровац}	1	3
241	ББ	Баина-Башта	Бајина Башта	{Баина-Башта}	1	3
242	БГ	Белград	Београд	{Бараево,Вождовац,Врачар,Гроцка,Звездара,Земун,Лазаревац,Младеновац,Нови-Београд,Обреновац,Палилула,Раковица,Савски-Венац,Сопот,Стари-Град,Сурчин,Чукарица}	1	3
243	БО	Бор	Бор	{Майданпек,Бор}	1	3
244	БП	Бачка-Паланка	Бачка Паланка	{Бачка-Паланка}	1	3
245	БТ	Бачка-Топола	Бачка Топола	{Бачка-Топола}	1	3
246	БЋ	Богатич	Богатић	{Богатич}	1	3
247	БУ	Буяновац	Бујановац	{Буяновац}	1	3
248	БЧ	Бечей	Бечеј	{Бечей}	1	3
249	ВА	Валево	Ваљево	{Лайковац,Лиг,Мионица,Осечина,Валево}	1	3
250	ВБ	Врнячка-Баня	Врњачка Бања	{Врнячка-Баня}	1	3
251	ВЛ	Власотинце	Власотинце	{Власотинце}	1	3
252	ВП	Велика-Плана	Велика Плана	{Велика-Плана}	1	3
253	ВР	Вране	Врање	{Босилеград,Владичин-Хан,Прешево,Трговиште,Вране}	1	3
254	ВС	Врбас	Врбас	{Врбас}	1	3
255	ВШ	Вршац	Вршац	{"Белая Церковь",Пландиште,Вршац}	1	3
256	ГЛ	Гнилане	Гњилане	{Витина,Косовска-Каменица,Ново-Брдо,Гнилане}	1	3
257	ГМ	Горни-Милановац	Горњи Милановац	{Горни-Милановац}	1	3
258	ДЕ	Деспотовац	Деспотовац	{Деспотовац}	1	3
259	ЂА	Джаковица	Ђаковица	{Дечани,Джаковица}	1	3
260	ЗА	Заечар	Зајечар	{Болевац,Сокобаня,Заечар}	1	3
261	ЗР	Зренянин	Зрењанин	{Житиште,Нови-Бечей,Нова-Црня,Сечань,Зренянин}	1	3
262	ИН	Инджия	Инђија	{Инджия}	1	3
263	ИЦ	Иваница	Ивањица	{Иваница}	1	3
264	ЈА	Ягодина	Јагодина	{Рековац,Ягодина}	1	3
265	КА	Канижа	Кањижа	{Канижа}	1	3
266	КВ	Кралево	Краљево	{Кралево}	1	3
267	КГ	Крагуевац	Крагујевац	{Баточина,Книч,Лапово,Рача,Крагуевац}	1	3
268	КЖ	Княжевац	Књажевац	{Княжевац}	1	3
269	КИ	Кикинда	Кикинда	{Чока,Нови-Кнежевац,Кикинда}	1	3
270	КЛ	Кладово	Кладово	{Кладово}	1	3
271	КМ	Косовска-Митровица	Косовска Митровица	{Вучитрн,Звечан,Зубин-Поток,Лепосавич,Србица,Косовска-Митровица}	1	3
272	КО	Ковин	Ковин	{Ковин}	1	3
273	КШ	Крушевац	Крушевац	{Брус,Варварин,Чичевац,Крушевац}	1	3
274	ЛБ	Лебане	Лебане	{Лебане}	1	3
275	ЛЕ	Лесковац	Лесковац	{Бойник,Медведжа,Црна-Трава,Лесковац}	1	3
276	ЛО	Лозница	Лозница	{Крупань,Любовия,Мали-Зворник,Лозница}	1	3
277	ЛУ	Лучани	Лучани	{Лучани}	1	3
278	НВ	Нова-Варош	Нова Варош	{Нова-Варош}	1	3
279	НГ	Неготин	Неготин	{Неготин}	1	3
280	НИ	Ниш	Ниш	{Долевац,Гаджин-Хан,Мерошина,Ражань,Сврлиг,Ниш}	1	3
281	НП	Нови-Пазар	Нови Пазар	{Нови-Пазар}	1	3
282	НС	Нови-Сад	Нови Сад	{Бач,Бачки-Петровац,Беочин,Жабаль,Петроварадин,Србобран,Сремски-Карловци,Темерин,Тител,Нови-Сад}	1	3
283	ПА	Панчево	Панчево	{Алибунар,Ковачица,Опово,Панчево}	1	3
284	ПБ	Прибой	Прибој	{Прибой}	1	3
285	ПЕ	Печ	Пећ	{Исток,Клина,Печ}	1	3
286	ПЖ	Пожега	Пожега	{Пожега}	1	3
287	ПЗ	Призрен	Призрен	{Гора,Ораховац,Сува-Река,Призрен}	1	3
288	ПИ	Пирот	Пирот	{Бабушница,Бела-Паланка,Димитровград,Пирот}	1	3
289	ПК	Прокупле	Прокупље	{Блаце,Житораджя,Куршумлия,Прокупле}	1	3
290	ПН	Парачин	Параћин	{Парачин}	1	3
291	ПО	Пожаревац	Пожаревац	{Велико-Градиште,Голубац,Жабари,Жагубица,Кучево,Мало-Црниче,Пожаревац}	1	3
292	ПП	Приеполе	Пријепоље	{Приеполе}	1	3
293	ПР	Приштина	Приштина	{Глоговац,Косово-Поле,Липлян,Обилич,Подуево,Приштина}	1	3
294	ПТ	Петровац	Петровац	{Петровац}	1	3
295	РА	Рашка	Рашка	{Рашка}	1	3
296	РУ	Рума	Рума	{Ириг,Печинци,Рума}	1	3
297	СА	Сента	Сента	{Ада,Сента}	1	3
298	СВ	Свилайнац	Свилајнац	{Свилайнац}	1	3
299	СД	Смедерево	Смедерево	{Смедерево}	1	3
300	СЈ	Сьеница	Сјеница	{Сьеница}	1	3
301	СМ	Сремска-Митровица	Сремска Митровица	{Сремска-Митровица}	1	3
302	СО	Сомбор	Сомбор	{Апатин,Кула,Оджаци,Сомбор}	1	3
303	СП	Смедеревска-Паланка	Смедеревска Паланка	{Смедеревска-Паланка}	1	3
304	СТ	Стара-Пазова	Стара Пазова	{Стара-Пазова}	1	3
305	СУ	Суботица	Суботица	{Мали-Иджош,Суботица}	1	3
306	СЦ	Сурдулица	Сурдулица	{Сурдулица}	1	3
307	ТО	Топола	Топола	{Топола}	1	3
308	ТС	Трстеник	Трстеник	{Трстеник}	1	3
309	ТТ	Тутин	Тутин	{Тутин}	1	3
310	ЋУ	Чуприя	Ћуприја	{Чуприя}	1	3
311	УБ	Уб	Уб	{Уб}	1	3
312	УЕ	Ужице	Ужице	{Ариле,Косьерич,Чаетина,Ужице}	1	3
313	УР	Урошевац	Урошевац	{Качаник,Урошевац,Штимле,Штрпце}	1	3
314	ЧА	Чачак	Чачак	{Чачак}	1	3
315	ША	Шабац	Шабац	{Владимирци,Коцелева,Шабац}	1	3
316	ШИ	Шид	Шид	{Шид}	1	3
317	AL	Алексинац	Aleksinac	{Алексинац}	1	3
318	AR	Аранджеловац	Aranđelovac	{Аранджеловац}	1	3
319	AC	Александровац	Aleksandrovac	{Александровац}	1	3
320	BB	Баина-Башта	Bajina Bašta	{Баина-Башта}	1	3
375	RU	Рума	Ruma	{Ириг,Печинци,Рума}	1	3
376	SA	Сента	Senta	{Ада,Сента}	1	3
321	BG	Белград	Beograd	{Бараево,Вождовац,Врачар,Гроцка,Звездара,Земун,Лазаревац,Младеновац,Нови-Београд,Обреновац,Палилула,Раковица,Савски-Венац,Сопот,Стари-Град,Сурчин,Чукарица}	1	3
322	BO	Бор	Bor	{Майданпек,Бор}	1	3
323	BP	Бачка-Паланка	Bačka Palanka	{Бачка-Паланка}	1	3
324	BT	Бачка-Топола	Bačka Topola	{Бачка-Топола}	1	3
325	BĆ	Богатич	Bogatić	{Богатич}	1	3
326	BU	Буяновац	Bujanovac	{Буяновац}	1	3
327	BČ	Бечей	Bečej	{Бечей}	1	3
328	VA	Валево	Valjevo	{Лайковац,Лиг,Мионица,Осечина,Валево}	1	3
329	VB	Врнячка-Баня	Vrnjačka Banja	{Врнячка-Баня}	1	3
330	VL	Власотинце	Vlasotince	{Власотинце}	1	3
331	VP	Велика-Плана	Velika Plana	{Велика-Плана}	1	3
332	VR	Вране	Vranje	{Босилеград,Владичин-Хан,Прешево,Трговиште,Вране}	1	3
333	VS	Врбас	Vrbas	{Врбас}	1	3
334	VŠ	Вршац	Vršac	{"Белая Церковь",Пландиште,Вршац}	1	3
335	GL	Гнилане	Gnjilane	{Витина,Косовска-Каменица,Ново-Брдо,Гнилане}	1	3
336	GM	Горни-Милановац	Gornji Milanovac	{Горни-Милановац}	1	3
337	DE	Деспотовац	Despotovac	{Деспотовац}	1	3
338	ĐA	Джаковица	Đakovica	{Дечани,Джаковица}	1	3
339	ZA	Заечар	Zaječar	{Болевац,Сокобаня,Заечар}	1	3
340	ZR	Зренянин	Zrenjanin	{Житиште,Нови-Бечей,Нова-Црня,Сечань,Зренянин}	1	3
341	IN	Инджия	Inđija	{Инджия}	1	3
342	IC	Иваница	Ivanjica	{Иваница}	1	3
343	JA	Ягодина	Jagodina	{Рековац,Ягодина}	1	3
344	KA	Канижа	Kanjiža	{Канижа}	1	3
345	KV	Кралево	Kraljevo	{Кралево}	1	3
346	KG	Крагуевац	Kragujevac	{Баточина,Книч,Лапово,Рача,Крагуевац}	1	3
347	KŽ	Княжевац	Knjaževac	{Княжевац}	1	3
348	KI	Кикинда	Kikinda	{Чока,Нови-Кнежевац,Кикинда}	1	3
349	KL	Кладово	Kladovo	{Кладово}	1	3
350	KM	Косовска-Митровица	Kosovska Mitrovica	{Вучитрн,Звечан,Зубин-Поток,Лепосавич,Србица,Косовска-Митровица}	1	3
351	KO	Ковин	Kovin	{Ковин}	1	3
352	KŠ	Крушевац	Kruševac	{Брус,Варварин,Чичевац,Крушевац}	1	3
353	LB	Лебане	Lebane	{Лебане}	1	3
354	LE	Лесковац	Leskovac	{Бойник,Медведжа,Црна-Трава,Лесковац}	1	3
355	LO	Лозница	Loznica	{Крупань,Любовия,Мали-Зворник,Лозница}	1	3
356	LU	Лучани	Lučani	{Лучани}	1	3
357	NV	Нова-Варош	Nova Varoš	{Нова-Варош}	1	3
358	NG	Неготин	Negotin	{Неготин}	1	3
359	NI	Ниш	Niš	{Долевац,Гаджин-Хан,Мерошина,Ражань,Сврлиг,Ниш}	1	3
360	NP	Нови-Пазар	Novi Pazar	{Нови-Пазар}	1	3
361	NS	Нови-Сад	Novi Sad	{Бач,Бачки-Петровац,Беочин,Жабаль,Петроварадин,Србобран,Сремски-Карловци,Темерин,Тител,Нови-Сад}	1	3
362	PA	Панчево	Pančevo	{Алибунар,Ковачица,Опово,Панчево}	1	3
363	PB	Прибой	Priboj	{Прибой}	1	3
364	PE	Печ	Peć	{Исток,Клина,Печ}	1	3
365	PŽ	Пожега	Požega	{Пожега}	1	3
366	PZ	Призрен	Prizren	{Гора,Ораховац,Сува-Река,Призрен}	1	3
367	PI	Пирот	Pirot	{Бабушница,Бела-Паланка,Димитровград,Пирот}	1	3
368	PK	Прокупле	Prokuplje	{Блаце,Житораджя,Куршумлия,Прокупле}	1	3
369	PN	Парачин	Paraćin	{Парачин}	1	3
370	PO	Пожаревац	Požarevac	{Велико-Градиште,Голубац,Жабари,Жагубица,Кучево,Мало-Црниче,Пожаревац}	1	3
371	PP	Приеполе	Prijepolje	{Приеполе}	1	3
372	PR	Приштина	Priština	{Глоговац,Косово-Поле,Липлян,Обилич,Подуево,Приштина}	1	3
373	PT	Петровац	Petrovac	{Петровац}	1	3
374	RA	Рашка	Raška	{Рашка}	1	3
377	SV	Свилайнац	Svilajnac	{Свилайнац}	1	3
378	SD	Смедерево	Smederevo	{Смедерево}	1	3
379	SJ	Сьеница	Sjenica	{Сьеница}	1	3
380	SM	Сремска-Митровица	Sremska Mitrovica	{Сремска-Митровица}	1	3
381	SO	Сомбор	Sombor	{Апатин,Кула,Оджаци,Сомбор}	1	3
382	SP	Смедеревска-Паланка	Smederevska Palanka	{Смедеревска-Паланка}	1	3
383	ST	Стара-Пазова	Stara Pazova	{Стара-Пазова}	1	3
384	SU	Суботица	Subotica	{Мали-Иджош,Суботица}	1	3
385	SC	Сурдулица	Surdulica	{Сурдулица}	1	3
386	TO	Топола	Topola	{Топола}	1	3
387	TS	Трстеник	Trstenik	{Трстеник}	1	3
388	TT	Тутин	Tutin	{Тутин}	1	3
389	ĆU	Чуприя	Ćuprija	{Чуприя}	1	3
390	UB	Уб	Ub	{Уб}	1	3
391	UE	Ужице	Užice	{Ариле,Косьерич,Чаетина,Ужице}	1	3
392	UR	Урошевац	Uroševac	{Качаник,Урошевац,Штимле,Штрпце}	1	3
393	ČA	Чачак	Čačak	{Чачак}	1	3
394	ŠA	Шабац	Šabac	{Владимирци,Коцелева,Шабац}	1	3
395	ŠI	Шид	Šid	{Шид}	1	3
396	AL	Алексинац	Aleksinac	{Алексинац}	1	1
397	AR	Аранђеловац	Aranđelovac	{Аранђеловац}	1	1
438	NI	Ниш	Niš	{Дољевац,"Гаџин Хан",Мерошина,Ражањ,Сврљиг,Ниш}	1	1
439	NP	Нови Пазар	Novi Pazar	{"Нови Пазар"}	1	1
440	NS	Нови Сад	Novi Sad	{Бач,"Бачки Петровац",Беочин,Жабаљ,Петроварадин,Србобран,"Сремски Карловци",Темерин,Тител,"Нови Сад"}	1	1
441	PA	Панчево	Pančevo	{Алибунар,Ковачица,Опово,Панчево}	1	1
442	PB	Прибој	Priboj	{Прибој}	1	1
443	PE	Пећ	Peć	{Исток,Клина,Пећ}	1	1
444	PŽ	Пожега	Požega	{Пожега}	1	1
445	PZ	Призрен	Prizren	{Гора,Ораховац,"Сува Река",Призрен}	1	1
446	PI	Пирот	Pirot	{Бабушница,"Бела Паланка",Димитровград,Пирот}	1	1
447	PK	Прокупље	Prokuplje	{Блаце,Житорађа,Куршумлија,Прокупље}	1	1
448	PN	Параћин	Paraćin	{Параћин}	1	1
449	PO	Пожаревац	Požarevac	{"Велико Градиште",Голубац,Жабари,Жагубица,Кучево,"Мало Црниће",Пожаревац}	1	1
450	PP	Пријепоље	Prijepolje	{Пријепоље}	1	1
451	PR	Приштина	Priština	{Глоговац,"Косово Поље",Липљан,Обилић,Подујево,Приштина}	1	1
452	PT	Петровац	Petrovac	{Петровац}	1	1
453	RA	Рашка	Raška	{Рашка}	1	1
454	RU	Рума	Ruma	{Ириг,Пећинци,Рума}	1	1
455	SA	Сента	Senta	{Ада,Сента}	1	1
456	SV	Свилајнац	Svilajnac	{Свилајнац}	1	1
457	SD	Смедерево	Smederevo	{Смедерево}	1	1
458	SJ	Сјеница	Sjenica	{Сјеница}	1	1
469	UB	Уб	Ub	{Уб}	1	1
398	AC	Александровац	Aleksandrovac	{Александровац}	1	1
399	BB	Бајина Башта	Bajina Bašta	{"Бајина Башта"}	1	1
400	BG	Београд	Beograd	{Барајево,Вождовац,Врачар,Гроцка,Звездара,Земун,Лазаревац,Младеновац,"Нови Београд",Обреновац,Палилула,Раковица,"Савски Венац",Сопот,"Стари Град",Сурчин,Чукарица}	1	1
401	BO	Бор	Bor	{Мајданпек,Бор}	1	1
402	BP	Бачка Паланка	Bačka Palanka	{"Бачка Паланка"}	1	1
403	BT	Бачка Топола	Bačka Topola	{"Бачка Топола"}	1	1
404	BĆ	Богатић	Bogatić	{Богатић}	1	1
405	BU	Бујановац	Bujanovac	{Бујановац}	1	1
406	BČ	Бечеј	Bečej	{Бечеј}	1	1
407	VA	Ваљево	Valjevo	{Лајковац,Љиг,Мионица,Осечина,Ваљево}	1	1
408	VB	Врњачка Бања	Vrnjačka Banja	{"Врњачка Бања"}	1	1
409	VL	Власотинце	Vlasotince	{Власотинце}	1	1
410	VP	Велика Плана	Velika Plana	{"Велика Плана"}	1	1
411	VR	Врање	Vranje	{Босилеград,"Владичин Хан",Прешево,Трговиште,Врање}	1	1
412	VS	Врбас	Vrbas	{Врбас}	1	1
413	VŠ	Вршац	Vršac	{"Бела Црква",Пландиште,Вршац}	1	1
414	GL	Гњилане	Gnjilane	{Витина,"Косовска Каменица","Ново Брдо",Гњилане}	1	1
415	GM	Горњи Милановац	Gornji Milanovac	{"Горњи Милановац"}	1	1
416	DE	Деспотовац	Despotovac	{Деспотовац}	1	1
417	ĐA	Ђаковица	Đakovica	{Дечани,Ђаковица}	1	1
418	ZA	Зајечар	Zaječar	{Бољевац,Сокобања,Зајечар}	1	1
419	ZR	Зрењанин	Zrenjanin	{Житиште,"Нови Бечеј","Нова Црња",Сечањ,Зрењанин}	1	1
420	IN	Инђија	Inđija	{Инђија}	1	1
421	IC	Ивањица	Ivanjica	{Ивањица}	1	1
422	JA	Јагодина	Jagodina	{Рековац,Јагодина}	1	1
423	KA	Кањижа	Kanjiža	{Кањижа}	1	1
424	KV	Краљево	Kraljevo	{Краљево}	1	1
425	KG	Крагујевац	Kragujevac	{Баточина,Кнић,Лапово,Рача,Крагујевац}	1	1
426	KŽ	Књажевац	Knjaževac	{Књажевац}	1	1
427	KI	Кикинда	Kikinda	{Чока,"Нови Кнежевац",Кикинда}	1	1
428	KL	Кладово	Kladovo	{Кладово}	1	1
429	KM	Косовска Митровица	Kosovska Mitrovica	{Вучитрн,Звечан,"Зубин Поток",Лепосавић,Србица,"Косовска Митровица"}	1	1
430	KO	Ковин	Kovin	{Ковин}	1	1
431	KŠ	Крушевац	Kruševac	{Брус,Варварин,Ћићевац,Крушевац}	1	1
432	LB	Лебане	Lebane	{Лебане}	1	1
433	LE	Лесковац	Leskovac	{Бојник,Медвеђа,"Црна Трава",Лесковац}	1	1
434	LO	Лозница	Loznica	{Крупањ,Љубовија,"Мали Зворник",Лозница}	1	1
435	LU	Лучани	Lučani	{Лучани}	1	1
436	NV	Нова Варош	Nova Varoš	{"Нова Варош"}	1	1
437	NG	Неготин	Negotin	{Неготин}	1	1
459	SM	Сремска Митровица	Sremska Mitrovica	{"Сремска Митровица"}	1	1
460	SO	Сомбор	Sombor	{Апатин,Кула,Оџаци,Сомбор}	1	1
461	SP	Смедеревска Паланка	Smederevska Palanka	{"Смедеревска Паланка"}	1	1
462	ST	Стара Пазова	Stara Pazova	{"Стара Пазова"}	1	1
463	SU	Суботица	Subotica	{"Мали Иђош",Суботица}	1	1
464	SC	Сурдулица	Surdulica	{Сурдулица}	1	1
465	TO	Топола	Topola	{Топола}	1	1
466	TS	Трстеник	Trstenik	{Трстеник}	1	1
467	TT	Тутин	Tutin	{Тутин}	1	1
468	ĆU	Ћуприја	Ćuprija	{Ћуприја}	1	1
470	UE	Ужице	Užice	{Ариље,Косјерић,Чајетина,Ужице}	1	1
471	UR	Урошевац	Uroševac	{Качаник,Урошевац,Штимље,Штрпце}	1	1
472	ČA	Чачак	Čačak	{Чачак}	1	1
473	ŠA	Шабац	Šabac	{Владимирци,Коцељева,Шабац}	1	1
474	ŠI	Шид	Šid	{Шид}	1	1
\.


--
-- Data for Name: api_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_country (id, name, lang_id, parent_id) FROM stdin;
1	Србиjа	1	\N
2	Русиjа	1	\N
3	Serbia	4	1
4	Russia	4	2
5	Сербия	3	1
6	Россия	3	2
\.


--
-- Data for Name: api_lang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_lang (id, code, name) FROM stdin;
1	rs_cyr	Српски
2	rs_lat	Srpski
3	ru	Русский
4	en	English
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add code	7	add_code
26	Can change code	7	change_code
27	Can delete code	7	delete_code
28	Can view code	7	view_code
29	Can add country	8	add_country
30	Can change country	8	change_country
31	Can delete country	8	delete_country
32	Can view country	8	view_country
33	Can add lang	9	add_lang
34	Can change lang	9	change_lang
35	Can delete lang	9	delete_lang
36	Can view lang	9	view_lang
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$oMyTXtiib96A$zcHciGEh1rtwPkH+jlFOH2pbrz/6Pa8ZQB2EzqGHdks=	2018-10-15 20:48:40.471407+00	t	root				t	t	2018-10-15 20:15:46.162545+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	api	code
8	api	country
9	api	lang
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-10-15 20:15:08.346716+00
2	auth	0001_initial	2018-10-15 20:15:10.875251+00
3	admin	0001_initial	2018-10-15 20:15:11.152648+00
4	admin	0002_logentry_remove_auto_add	2018-10-15 20:15:11.193+00
5	admin	0003_logentry_add_action_flag_choices	2018-10-15 20:15:11.238761+00
6	api	0001_initial	2018-10-15 20:15:11.78936+00
7	contenttypes	0002_remove_content_type_name	2018-10-15 20:15:11.943546+00
8	auth	0002_alter_permission_name_max_length	2018-10-15 20:15:11.976881+00
9	auth	0003_alter_user_email_max_length	2018-10-15 20:15:12.021595+00
10	auth	0004_alter_user_username_opts	2018-10-15 20:15:12.061224+00
11	auth	0005_alter_user_last_login_null	2018-10-15 20:15:12.121338+00
12	auth	0006_require_contenttypes_0002	2018-10-15 20:15:12.140046+00
13	auth	0007_alter_validators_add_error_messages	2018-10-15 20:15:12.18298+00
14	auth	0008_alter_user_username_max_length	2018-10-15 20:15:12.311785+00
15	auth	0009_alter_user_last_name_max_length	2018-10-15 20:15:12.35577+00
16	sessions	0001_initial	2018-10-15 20:15:12.522702+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
lbe1ylncnfgh6tmfpp3jhcvu8mx0yot2	NGU5OGU3YzFkODJjNWUzZjE1MWFiMmRiNjVlOGMzOTYyNzhlYzQwOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MjM0ZDA5YTlkMGRiMzRiMWU3ZDA1N2UyMzgzZWEyMWE2OTEyNGRiIn0=	2018-10-29 20:48:40.564734+00
\.


--
-- Name: api_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_code_id_seq', 474, true);


--
-- Name: api_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_country_id_seq', 6, true);


--
-- Name: api_lang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_lang_id_seq', 4, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 16, true);


--
-- Name: api_code api_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_code
    ADD CONSTRAINT api_code_pkey PRIMARY KEY (id);


--
-- Name: api_country api_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_country
    ADD CONSTRAINT api_country_pkey PRIMARY KEY (id);


--
-- Name: api_lang api_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_lang
    ADD CONSTRAINT api_lang_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: api_code_country_id_0866e243; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_code_country_id_0866e243 ON public.api_code USING btree (country_id);


--
-- Name: api_code_lang_id_4d2dc3d2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_code_lang_id_4d2dc3d2 ON public.api_code USING btree (lang_id);


--
-- Name: api_country_lang_id_9e02436b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_country_lang_id_9e02436b ON public.api_country USING btree (lang_id);


--
-- Name: api_country_parent_id_ebf00add; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_country_parent_id_ebf00add ON public.api_country USING btree (parent_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: api_code api_code_country_id_0866e243_fk_api_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_code
    ADD CONSTRAINT api_code_country_id_0866e243_fk_api_country_id FOREIGN KEY (country_id) REFERENCES public.api_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_code api_code_lang_id_4d2dc3d2_fk_api_lang_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_code
    ADD CONSTRAINT api_code_lang_id_4d2dc3d2_fk_api_lang_id FOREIGN KEY (lang_id) REFERENCES public.api_lang(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_country api_country_lang_id_9e02436b_fk_api_lang_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_country
    ADD CONSTRAINT api_country_lang_id_9e02436b_fk_api_lang_id FOREIGN KEY (lang_id) REFERENCES public.api_lang(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_country api_country_parent_id_ebf00add_fk_api_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_country
    ADD CONSTRAINT api_country_parent_id_ebf00add_fk_api_country_id FOREIGN KEY (parent_id) REFERENCES public.api_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

