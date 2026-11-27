-- DraftHouse V2 staging migration. Run as postgres in Supabase SQL Editor.
-- Existing V1 tables and balances are preserved. Do not use both versions concurrently.
begin;
create table if not exists public.dh2_board(id int primary key check(id=1), tour int not null default 1, locked boolean not null default true, lines jsonb not null, announcement text not null default 'Welcome to DraftHouse V2');
insert into public.dh2_board(id,lines) values(1,$markets$[{"id": 0, "category": "Company", "name": "Engine 25", "description": "Total Engine 25 runs.", "line": 5.5, "over": -102, "under": -118, "group": "e", "closed": false}, {"id": 1, "category": "Company", "name": "Ladder 10", "description": "Total Ladder 10 runs.", "line": 2.5, "over": 105, "under": -125, "group": "l", "closed": false}, {"id": 2, "category": "Company", "name": "Battalion 46", "description": "Total Battalion 46 runs.", "line": 2.5, "over": 140, "under": -165, "group": "b", "closed": false}, {"id": 3, "category": "Company", "name": "Workhorse", "description": "Total engine runs.", "line": 9.5, "over": 300, "under": -350, "group": "e", "closed": false}, {"id": 4, "category": "Company", "name": "Truckin’ Around", "description": "Total ladder runs.", "line": 4.5, "over": 300, "under": -350, "group": "l", "closed": false}, {"id": 5, "category": "Company", "name": "Chief’s Overtime", "description": "Total battalion runs.", "line": 4.5, "over": 400, "under": -450, "group": "b", "closed": false}, {"id": 6, "category": "Company", "name": "Triple Threat", "description": "All three companies record at least three runs.", "line": null, "over": 400, "under": -450, "group": "triple", "closed": false}, {"id": 7, "category": "Company", "name": "Equalizer", "description": "Engine and ladder finish with equal totals.", "line": null, "over": 500, "under": -550, "group": "equal", "closed": false}, {"id": 8, "category": "Company", "name": "Dirty Dozen", "description": "Combined company runs, not distinct incidents.", "line": 11.5, "over": 150, "under": -170, "group": "total", "closed": false}, {"id": 9, "category": "Tour", "name": "Hot Momma", "description": "Total AFs.", "line": 0.5, "over": -150, "under": 125, "group": "af", "closed": false}, {"id": 10, "category": "Tour", "name": "Hot Momma Deluxe", "description": "Total AFs; default requires two or more.", "line": 1.5, "over": 270, "under": -300, "group": "af", "closed": false}, {"id": 11, "category": "Tour", "name": "Hat Trick", "description": "Total AFs; default requires three or more.", "line": 2.5, "over": 700, "under": -800, "group": "af", "closed": false}, {"id": 12, "category": "Tour", "name": "Full Send", "description": "All three companies dispatched to one incident.", "line": null, "over": -150, "under": 125, "group": "full", "closed": false}, {"id": 13, "category": "Tour", "name": "Sleep Killer", "description": "Distinct overnight dispatches, midnight to 7:30 AM.", "line": 1.5, "over": 170, "under": -200, "group": "night", "closed": false}, {"id": 14, "category": "Tour", "name": "False Prophet", "description": "Total automatic alarm calls.", "line": 0.5, "over": -115, "under": -105, "group": "alarm", "closed": false}, {"id": 15, "category": "Tour", "name": "Frequent Flyer", "description": "Number of repeat visits to previously dispatched locations this tour.", "line": 2.5, "over": 300, "under": -350, "group": "repeat", "closed": false}, {"id": 16, "category": "Tour", "name": "Cold Dinner", "description": "Dispatch between 5 and 7 PM.", "line": null, "over": -120, "under": 100, "group": "dinner", "closed": false}, {"id": 17, "category": "Tour", "name": "Walk of Shame", "description": "Dispatch between 6:30 and 7:30 AM at tour end.", "line": null, "over": 200, "under": -230, "group": "walk", "closed": false}, {"id": 18, "category": "Tour", "name": "Boomerang", "description": "At least one repeat dispatch to the same location this tour.", "line": null, "over": 150, "under": -170, "group": "repeat", "closed": false}, {"id": 19, "category": "Tour", "name": "Double Tap", "description": "Two distinct dispatches within 30 minutes.", "line": null, "over": -150, "under": 125, "group": "double", "closed": false}, {"id": 20, "category": "Tour", "name": "Chief’s Vacation", "description": "Battalion 46 records zero runs.", "line": null, "over": 450, "under": -500, "group": "b", "closed": false}, {"id": 21, "category": "Tour", "name": "Holy Grail", "description": "All three companies record zero runs.", "line": null, "over": 1000, "under": -1200, "group": "total", "closed": false}, {"id": 22, "category": "Tour", "name": "Breakfast Bandit", "description": "Dispatch between 7:30 and 9 AM.", "line": null, "over": 150, "under": -170, "group": "breakfast", "closed": false}, {"id": 23, "category": "Tour", "name": "Lunch Breaker", "description": "Dispatch between noon and 1 PM.", "line": null, "over": 150, "under": -170, "group": "lunch", "closed": false}, {"id": 24, "category": "Tour", "name": "Night Shift", "description": "More distinct overnight than daytime dispatches.", "line": null, "over": 150, "under": -170, "group": "nightshift", "closed": false}, {"id": 25, "category": "Tour", "name": "Rush Hour", "description": "Dispatch between 4 and 6 PM.", "line": null, "over": -110, "under": -110, "group": "rush", "closed": false}, {"id": 26, "category": "Tour", "name": "Marathon", "description": "Three distinct dispatches within one hour.", "line": null, "over": 400, "under": -450, "group": "marathon", "closed": false}, {"id": 27, "category": "House", "name": "The Cat Came Back", "description": "The regular house cat appears.", "line": null, "over": -150, "under": 125, "group": "cat", "closed": false}, {"id": 28, "category": "House", "name": "Special Delivery", "description": "Unexpected food delivery arrives.", "line": null, "over": 150, "under": -170, "group": "delivery", "closed": false}, {"id": 29, "category": "House", "name": "The Mascot", "description": "A dog unexpectedly visits.", "line": null, "over": 400, "under": -450, "group": "dog", "closed": false}, {"id": 30, "category": "House", "name": "The Care Package", "description": "Unsolicited food is dropped off.", "line": null, "over": 200, "under": -230, "group": "food", "closed": false}]$markets$::jsonb) on conflict do nothing;
create table if not exists public.dh2_deputies(id uuid primary key references auth.users(id));
create table if not exists public.dh2_tickets(id uuid primary key, player uuid not null references public.players(id), tour int not null, legs jsonb not null, stake numeric not null, ret numeric not null, status text not null default 'Pending');
create table if not exists public.dh2_chat(id bigint generated always as identity primary key, player uuid not null references public.players(id), body text not null, created timestamptz default now());
create table if not exists public.dh2_audit(id bigint generated always as identity primary key, actor uuid, action text, created timestamptz default now());
create table if not exists public.dh2_invites(code uuid primary key default gen_random_uuid(), expires timestamptz default now()+interval '7 days', used boolean default false);
alter table public.dh2_board enable row level security; revoke all on public.dh2_board from anon,authenticated;
alter table public.dh2_deputies enable row level security; revoke all on public.dh2_deputies from anon,authenticated;
alter table public.dh2_tickets enable row level security; revoke all on public.dh2_tickets from anon,authenticated;
alter table public.dh2_chat enable row level security; revoke all on public.dh2_chat from anon,authenticated;
alter table public.dh2_audit enable row level security; revoke all on public.dh2_audit from anon,authenticated;
alter table public.dh2_invites enable row level security; revoke all on public.dh2_invites from anon,authenticated;
create or replace function public.dh2_price(m jsonb, ln numeric, side text) returns numeric language plpgsql immutable set search_path='' as $$
declare base numeric; prob numeric; q numeric; begin
base:=(m->>side)::numeric;
if m->>'line' is null then return base; end if;
prob:=case when base<0 then abs(base)/(100+abs(base)) else 100/(100+base) end;
q:=greatest(.01,least(.99,1/(1+exp(-pg_catalog.ln(prob/(1-prob))+case when side='over' then .48 else -.48 end*(ln-(m->>'line')::numeric)))));
return case when q>=.5 then -round(100*q/(1-q)) else round(100*(1-q)/q) end;
end $$;
create or replace function public.dh2_action(action text,payload jsonb default '{}'::jsonb) returns jsonb language plpgsql security definer set search_path='' as $$
declare u uuid:=auth.uid(); b public.dh2_board%rowtype; p public.players%rowtype; owner boolean; deputy boolean; m jsonb; x jsonb; legs jsonb:='[]'; groups text[]:='{}'; i int; side text; ln numeric; o numeric; stake numeric; ret numeric; tid uuid; ticket public.dh2_tickets%rowtype; result numeric; lost boolean; factor numeric; countlegs int; code uuid;
begin
if u is null then raise exception 'Sign in first'; end if;
select * into b from public.dh2_board where id=1 for update;
select exists(select 1 from public.dh_admins where id=u) into owner;
select exists(select 1 from public.dh2_deputies where id=u) into deputy;
select * into p from public.players where id=u for update;
if action='join' and p.id is null then
 if not owner then update public.dh2_invites set used=true where dh2_invites.code=(payload->>'code')::uuid and not used and expires>now(); if not found then raise exception 'Valid invitation required'; end if; end if;
 if length(trim(coalesce(payload->>'name',''))) not between 1 and 32 then raise exception 'Invalid name'; end if;
 insert into public.players(id,nickname,avatar) values(u,trim(payload->>'name'),payload->>'avatar');
 select * into p from public.players where id=u;
end if;
if p.id is null then return jsonb_build_object('uid',u,'joined',false); end if;
if action='place' then
 if b.locked or (payload->>'tour')::int is distinct from b.tour then raise exception 'Tour closed or changed'; end if;
 tid:=(payload->>'id')::uuid; if tid is null then raise exception 'Ticket ID required'; end if;
 if exists(select 1 from public.dh2_tickets where id=tid and player=u) then action:='read'; else
 stake:=(payload->>'stake')::numeric;
 if stake is null or stake::text in ('NaN','Infinity','-Infinity') or stake<1 or stake>p.credits or stake<>round(stake,2) then raise exception 'Invalid stake'; end if;
 if jsonb_typeof(payload->'legs') is distinct from 'array' or jsonb_array_length(payload->'legs') not between 1 and 10 then raise exception 'Choose 1–10 picks'; end if;
 ret:=stake;
 for x in select * from jsonb_array_elements(payload->'legs') loop
 i:=(x->>'i')::int; side:=x->>'side'; ln:=(x->>'line')::numeric;
 if i is null or i<0 or i>=jsonb_array_length(b.lines) or side is null or side not in ('over','under') then raise exception 'Invalid pick'; end if;
 m:=b.lines->i;
 if (m->>'closed')::boolean or m->>'group'=any(groups) then raise exception 'Closed or related duplicate market'; end if;
 groups:=array_append(groups,m->>'group');
 if m->>'line' is null then if ln is not null then raise exception 'Invalid yes/no line'; end if; else if ln is null or ln<.5 or ln>30.5 or mod(ln,.5)<>0 then raise exception 'Invalid line'; end if; end if;
 o:=public.dh2_price(m,ln,side); if o is distinct from (x->>'odds')::numeric then raise exception 'Odds changed; review ticket'; end if;
 ret:=ret*case when o>0 then 1+o/100 else 1+100/abs(o) end;
 legs:=legs||jsonb_build_array(jsonb_build_object('i',i,'name',m->>'name','line',ln,'side',side,'odds',o));
 end loop;
 update public.players set credits=credits-stake where id=u;
 insert into public.dh2_tickets(id,player,tour,legs,stake,ret) values(tid,u,b.tour,legs,stake,round(ret,2)); end if;
elsif action='avatar' then update public.players set avatar=left(payload->>'avatar',32) where id=u;
elsif action='chat' then if length(trim(coalesce(payload->>'body',''))) not between 1 and 500 then raise exception 'Invalid message'; end if; insert into public.dh2_chat(player,body) values(u,trim(payload->>'body'));
elsif action in ('lock','open','market','settle','announce','invite','deputy') then
 if not(owner or deputy) then raise exception 'Restricted access'; end if;
 if action='lock' then update public.dh2_board set locked=true where id=1;
 elsif action='open' then update public.dh2_board set locked=false where id=1;
 elsif action='announce' then update public.dh2_board set announcement=left(payload->>'body',500) where id=1;
 elsif action='invite' then insert into public.dh2_invites default values returning dh2_invites.code into code;
 elsif action='deputy' then if not owner then raise exception 'Commissioner only'; end if; if (payload->>'enabled')::boolean then insert into public.dh2_deputies values((payload->>'id')::uuid) on conflict do nothing; else delete from public.dh2_deputies where id=(payload->>'id')::uuid; end if;
 elsif action='market' then
 i:=(payload->>'i')::int; if i is null or i<0 or i>=jsonb_array_length(b.lines) then raise exception 'Invalid market'; end if; m:=b.lines->i;
 if m->>'line' is not null then ln:=(payload->>'line')::numeric; if ln is null or ln<.5 or ln>30.5 or mod(ln,.5)<>0 then raise exception 'Invalid line'; end if; m:=jsonb_set(m,'{line}',to_jsonb(ln)); end if;
 foreach side in array array['over','under'] loop o:=(payload->>side)::numeric; if o is null or abs(o) not between 100 and 10000 or o<>round(o) then raise exception 'Invalid odds'; end if; m:=jsonb_set(m,array[side],to_jsonb(o)); end loop;
 m:=jsonb_set(m,'{closed}',to_jsonb(coalesce((payload->>'closed')::boolean,false))); update public.dh2_board set lines=jsonb_set(lines,array[i::text],m) where id=1;
 elsif action='settle' then
 if not b.locked or jsonb_typeof(payload->'results') is distinct from 'array' or jsonb_array_length(payload->'results')<>jsonb_array_length(b.lines) then raise exception 'Lock board and enter all results'; end if;
 for i in 0..jsonb_array_length(b.lines)-1 loop result:=(payload->'results'->>i)::numeric; if result is not null and (result<0 or result<>round(result) or result::text='NaN' or (b.lines->i->>'line' is null and result>1)) then raise exception 'Invalid result'; end if; end loop;
 for ticket in select * from public.dh2_tickets where tour=b.tour and status='Pending' loop
 lost:=false; factor:=1;
 for x in select * from jsonb_array_elements(ticket.legs) loop result:=(payload->'results'->>((x->>'i')::int))::numeric; ln:=(x->>'line')::numeric; side:=x->>'side'; o:=(x->>'odds')::numeric;
 if result is null or (ln is not null and result=ln) then continue; end if;
 if (ln is null and ((side='over' and result=1) or (side='under' and result=0))) or (ln is not null and ((side='over' and result>ln) or (side='under' and result<ln))) then factor:=factor*case when o>0 then 1+o/100 else 1+100/abs(o) end; else lost:=true; end if;
 end loop;
 update public.dh2_tickets set status=case when lost then 'Lost' when factor=1 then 'Void' else 'Won' end,ret=case when lost then 0 else round(ticket.stake*factor,2) end where id=ticket.id;
 if not lost then update public.players set credits=credits+round(ticket.stake*factor,2) where id=ticket.player; end if;
 end loop; update public.dh2_board set tour=tour+1,locked=true where id=1;
 end if;
 insert into public.dh2_audit(actor,action) values(u,action);
elsif action not in ('read','join') then raise exception 'Unknown action'; end if;
return jsonb_build_object('uid',u,'joined',true,'owner',owner,'deputy',deputy,'invite',code,'board',(select to_jsonb(q) from public.dh2_board q where id=1),'players',(select coalesce(jsonb_agg(jsonb_build_object('id',id,'name',nickname,'avatar',avatar,'credits',credits)),'[]') from public.players),'tickets',(select coalesce(jsonb_agg(to_jsonb(t)),'[]') from public.dh2_tickets t where player=u),'chat',(select coalesce(jsonb_agg(to_jsonb(c)),'[]') from (select c.body,c.created,p.nickname from public.dh2_chat c join public.players p on p.id=c.player order by c.id desc limit 50)c),'audit',case when owner or deputy then (select coalesce(jsonb_agg(to_jsonb(a)),'[]') from (select * from public.dh2_audit order by id desc limit 50)a) else '[]'::jsonb end);
end $$;
revoke all on function public.dh2_action(text,jsonb) from public,anon;
grant execute on function public.dh2_action(text,jsonb) to authenticated;
revoke all on function public.dh2_price(jsonb,numeric,text) from public,anon,authenticated;
commit;
